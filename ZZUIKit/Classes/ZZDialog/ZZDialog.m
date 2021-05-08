//
//  ZZDialog.m
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/12.
//

#import "ZZDialog.h"
#import <ZZUIKit/ZZUIKitEx.h>


@implementation ZZDialog
//NSFontAttributeName

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.handleView];
        self.cancelMargin = ZZDialogCancelMarginMake(10, 10);
        self.cancelPosition = ZZDialogCancelPositionTopRight;
    }
    return self;
};

-(void)setHandleDelegate:(id<ZZDialogHandleDelegate>)handleDelegate{
    _handleDelegate = handleDelegate;
    _handleView.frame = [handleDelegate preferredFrameForHandleInDialog:self];
    NSArray *dicArr = [handleDelegate itemsForHandleInDialog:self];
//    @weakify(self);
    [dicArr enumerateObjectsUsingBlock:^(NSDictionary *itemDic, NSUInteger idx, BOOL * _Nonnull stop) {
//        @strongify(self);
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        NSString *title = itemDic[ZZTitleKey];
        UIColor *titleColor = itemDic[ZZTitleColorKey] ? itemDic[ZZTitleColorKey]:zz_RGBHex(0x999999) ;
        UIFont *font = itemDic[ZZFontKey] ? itemDic[ZZFontKey] : [UIFont systemFontOfSize:20];
        UIColor *bgColor = itemDic[ZZBgcKey] ? itemDic[ZZBgcKey] : zz_RGBHex(0xFFFFFF);
        UIImage *img = itemDic[ZZImgKey];
        
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
        btn.titleLabel.font = font;
        [btn setBackgroundColor:bgColor];
        if (img) {
            [btn setImage:img forState:UIControlStateNormal];
        }
        
        void(^click)(void) = itemDic[ZZActionKey];
        
        btn.zz_click(^(UIControl *control){
            click();
        });
        [_handleView insertArrangedSubview:btn atIndex:idx];
    }];
    if (dicArr.count > 2) {
        _handleView.axis = UILayoutConstraintAxisVertical;
    }
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

-(void)setContentDelegate:(id<ZZDialogContenDelegate>)contentDelegate{
    _contentDelegate = contentDelegate;
    _contentView = [contentDelegate viewForContentInDialog:self];
    _contentView.frame = [contentDelegate preferredFrameForContentInDialog:self];
    [self addSubview:_contentView];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

-(void)setCancelImg:(UIImage *)cancelImg{
    _cancelImg = cancelImg;
    self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.cancelBtn setImage:cancelImg forState:UIControlStateNormal];
}

-(void)setCancelBtn:(UIButton *)cancelBtn{
    [_cancelBtn removeFromSuperview];
    _cancelBtn = cancelBtn;
    if (cancelBtn) {
        __weak typeof(self) weakSelf = self;
        cancelBtn.zz_click(^(UIControl *btn){
            [weakSelf dismiss];
        });
    }
    [self placeCancelBtn];
}

-(void)dismiss{
    UIViewController *controller = [self zz_viewController];
    if (!controller ) {
        return;
    }
    if (controller.presentingViewController) {
        //presented
        [controller dismissViewControllerAnimated:false completion:nil];
    }else{
        if (self.superview != controller.view) {
            [self.superview removeFromSuperview];
        }else{
            [self removeFromSuperview];
        }
    }
}

-(void)dismissThen:(void(^)(void))todo{
    UIViewController *controller = [self zz_viewController];
    if (!controller ) {
        return;
    }
    if (controller.presentingViewController) {
        //presented
        [controller dismissViewControllerAnimated:false completion:todo];
    }else{
        if (self.superview != controller.view) {
            [self.superview removeFromSuperview];
        }else{
            [self removeFromSuperview];
            
        }
        if (todo) {
            todo();
        }
    }
}

-(void)setCancelPosition:(ZZDialogCancelPosition)cancelPosition{
    _cancelPosition = cancelPosition;
    [self placeCancelBtn];
}

-(void)setCancelMargin:(ZZDialogCancelMargin)cancelMargin{
    _cancelMargin = cancelMargin;
    [self placeCancelBtn];
}

-(void)placeCancelBtn{
    if (!_cancelBtn) {
        return;
    }
    switch (_cancelPosition) {
        case ZZDialogCancelPositionTopRight:{
                _cancelBtn.zz_right = self.zz_width - _cancelMargin.paddingRight;
                _cancelBtn.zz_top = _cancelMargin.paddingTop;
                [self addSubview:_cancelBtn];
            }
            break;
        case ZZDialogCancelPositionBottomOutside:{
                _cancelBtn.zz_centerX = self.zz_width/2;
                _cancelBtn.zz_top = self.zz_height + _cancelMargin.paddingTop;
                [self addSubview:_cancelBtn];
            }
            break;
        default:{
                _cancelBtn.zz_centerX = self.zz_width;
                _cancelBtn.zz_centerY = 0;
                [self addSubview:_cancelBtn];
            }
            break;
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
     if (view == nil) {
       CGPoint tempoint = [_cancelBtn convertPoint:point fromView:self];
           if (CGRectContainsPoint(_cancelBtn.bounds, tempoint)){
              view = _cancelBtn;
           }
     }
    return view;
}

-(UIStackView *)handleView{
    if(!_handleView){
        _handleView = [[UIStackView alloc] init];
        _handleView.axis = UILayoutConstraintAxisHorizontal;
        _handleView.distribution = UIStackViewDistributionFillEqually;
        _handleView.alignment = UIStackViewAlignmentFill;
        _handleView.spacing = 0.8;
    }
    return _handleView;
}

@end
