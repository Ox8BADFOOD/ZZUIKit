//
//  ZZSOView.m
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/15.
//

#import "ZZSOView.h"
#import <ZZUIKitEx/ZZUIKitEx.h>
#import <ZZUIKitEx/UIButton+ZZAnima.h>
#import <Aspects/Aspects.h>

@interface ZZSOView()
@property(nonatomic,strong) UIStackView *itemsStack;
@property(nonatomic,assign) NSInteger currentIndex;
@property(nonatomic,assign) NSInteger lastIndex;
@property(nonatomic,assign) NSTimeInterval animaDuration;
@property(nonatomic,strong) NSMutableDictionary <NSNumber *,UIViewController *>*vcDic;
@end

@implementation ZZSOView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.itemsStack.frame = CGRectMake(0, 0, self.zz_width, self.zz_height);
        [self addSubview:self.itemsStack];
        self.vcDic = [NSMutableDictionary dictionary];
    }
    return self;
}

-(void)setDelegate:(id<ZZSOContentDelegate>)delegate{
    _delegate = delegate;
    [self reloadData];
}

-(void)reloadData{
    for (UIView *view in _itemsStack.arrangedSubviews) {
        [_itemsStack removeArrangedSubview:view];
    }
    
    NSInteger count = [self.delegate numberOfZZSoItem];
       for (int i = 0; i < count; i++) {
           NSDictionary *itemDic = [self.delegate ZZSoView:self itemForIndex:i];
           NSString *title = itemDic[ZZTitleKey] ? itemDic[ZZTitleKey] : @"replace me";
           UIColor *titleColor = itemDic[ZZTitleColorKey] ? itemDic[ZZTitleColorKey]:zz_RGBHex(0x999999) ;
           UIColor *titleSelectColor = itemDic[ZZTitleColorSelectKey] ? itemDic[ZZTitleColorSelectKey]:zz_RGBHex(0x333333) ;
           UIFont *font = itemDic[ZZFontKey] ? itemDic[ZZFontKey] : [UIFont systemFontOfSize:20];
           UIColor *bgColor = itemDic[ZZBgcKey] ? itemDic[ZZBgcKey] : zz_RGBHex(0xFFFFFF);
           UIImage *img = itemDic[ZZImgKey];
           UIImage *selImg = itemDic[ZZImgSelectKey];
           NSString *rotate = itemDic[ZZRotateKey];
           
           UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
           [btn aspect_hookSelector:@selector(layoutSubviews) withOptions:AspectPositionAfter usingBlock:^(void){
               [btn zz_contentReverse:2];
           } error:nil];
           [btn setTitle:title forState:UIControlStateNormal];
           [btn setTitleColor:titleColor forState:UIControlStateNormal];
           [btn setTitleColor:titleSelectColor forState:UIControlStateSelected];
           btn.titleLabel.font = font;
           btn.backgroundColor = bgColor;
           [btn setImage:img forState:UIControlStateNormal];
           [btn setImage:selImg forState:UIControlStateSelected];
           [self.itemsStack addArrangedSubview:btn];
           
           
           if ([self.delegate respondsToSelector:@selector(ZZSoView:timeForControllerAnimaAtIndex:)]) {
               _animaDuration = [self.delegate ZZSoView:self timeForControllerAnimaAtIndex:i];
           }else{
               _animaDuration = 0.5;
           }
           __weak typeof(self) weakSelf = self;
           btn.zz_click(^(UIControl * _Nullable control) {
               UIButton *btn = (UIButton *)control;
               [self handleUserInteractionEnabled];
               
               //存储当前点击的index
               weakSelf.currentIndex = i;
               [self vcsAppendIndex:i];
               
               //展示视图
               if (!btn.selected) {
                   [self show];
               }else{
                   [self dismiss];
               }
               
               //处理动画
               NSArray *views = self.itemsStack.arrangedSubviews;
               for (UIButton *button in views) {
                   if ([btn isEqual:button]) {
                       button.selected = !button.selected;
                       if (rotate) {
                           [btn zz_imgAnmimaRotateDuration:weakSelf.animaDuration];
                       }
                   }else{
                       button.selected = false;
                       if (button.zz_imgRotated) {
                           [button zz_imgAnmimaRotateDuration:weakSelf.animaDuration];
                       }
                   }
                   
               }
               if ([self.delegate respondsToSelector:@selector(ZZSoView:didClickItemAtIndex:)]) {
                   [self.delegate ZZSoView:self didClickItemAtIndex:i];
               }
               weakSelf.lastIndex = i;
           });
       }
}

-(void)handleUserInteractionEnabled{
    for (UIButton *button in self.itemsStack.arrangedSubviews) {
         button.userInteractionEnabled = false;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.animaDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (UIButton *button in self.itemsStack.arrangedSubviews) {
            button.userInteractionEnabled = true;
        }
    });
}


-(void)vcsAppendIndex:(NSInteger)index{
    UIViewController *contentVC = [self.delegate ZZSoView:self controllerAtIndex:index];
    if (!contentVC) {
        return;
    }
    if ([self.vcDic.allKeys containsObject:@(index)]) {
        return;
    }else{
        [self.vcDic setObject:contentVC forKey:@(index)];
        UIViewController *currentVC = [self zz_viewController];
        [currentVC addChildViewController:contentVC];
    }
}

-(void)show{
    [self dismissDuration:0];
    UIViewController *contentVC = [self.vcDic objectForKey:@(_currentIndex)];
    if (!contentVC) {return;}
    UIViewController *currentVC = [self zz_viewController];
    CGRect finalRect = [self.delegate ZZSoView:self rectForControllerAtIndex:_currentIndex];
    contentVC.view.frame = CGRectMake(0, self.zz_bottom, SCREEN_W(), 0);;
    [self addMaskController];
    [UIView animateWithDuration:_animaDuration animations:^{
        contentVC.view.frame = finalRect;
    }];
    [currentVC.view addSubview:contentVC.view];
    [contentVC didMoveToParentViewController:currentVC];
}

-(void)dismiss{
    [self dismissDuration:_animaDuration];
}

/// 消失内容
-(void)dismissDuration:(NSTimeInterval)duration{
     UIViewController *lastContentVC = [self.vcDic objectForKey:@(_lastIndex)];
    if (!lastContentVC) {return;}
    CGRect starRect = CGRectMake(0, self.zz_bottom, SCREEN_W(), 0);
    [UIView animateWithDuration:duration animations:^{
       lastContentVC.view.frame = starRect;
    } completion:^(BOOL finished) {
       [self dismissMaskController];
    }];
}

/// 显示上一次展现的内容
-(void)showLast{
    [self show];
}


/// 添加遮罩层
-(void)addMaskController{
    if (!_maskVC) {
        return;
    }
    UIViewController *currentVC = [self zz_viewController];
    [currentVC addChildViewController:_maskVC];
    _maskVC.view.frame = CGRectMake(0, self.zz_bottom, SCREEN_W(), SCREEN_H() - self.zz_bottom);
    [[self zz_viewController].view addSubview:_maskVC.view];
    [currentVC.view addSubview:_maskVC.view];
    [self.maskVC didMoveToParentViewController:[self zz_viewController]];
}

-(void)dismissMaskController{
    if (!_maskVC) {
        return;
    }
    _maskVC.view.frame = CGRectMake(0, self.zz_bottom, SCREEN_W(), 0);
}

-(UIStackView *)itemsStack{
    if(!_itemsStack){
        _itemsStack = [[UIStackView alloc] init];
        _itemsStack.axis = UILayoutConstraintAxisHorizontal;
        _itemsStack.distribution = UIStackViewDistributionFillEqually;
        _itemsStack.alignment = UIStackViewAlignmentFill;
        _itemsStack.spacing = 0;
    }
    return _itemsStack;
}
@end
