//
//  ZZMaskView.m
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/13.
//

#import "ZZMaskView.h"

@interface ZZMaskView()
@property(nonatomic,strong) UIVisualEffectView * visualView;
@end

@implementation ZZMaskView

-(void)setBlurStyle:(UIBlurEffectStyle)blurStyle{
    _blurStyle = blurStyle;
    //创建毛玻璃效果
    self.backgroundColor = [UIColor clearColor];
    UIBlurEffect * effect = [UIBlurEffect effectWithStyle:self.blurStyle];
    self.visualView.effect = effect;
    [self addSubview:self.visualView];
}

-(void)setMaskColor:(UIColor *)maskColor{
    _maskColor = maskColor;
    [self.visualView removeFromSuperview];
    self.backgroundColor = self.maskColor;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    if (_visualView) {
        _visualView.frame = self.bounds;
    }
}

-(UIVisualEffectView *)visualView{
    if(!_visualView){
        _visualView = [[UIVisualEffectView alloc] init];
    }
    return _visualView;
}

@end
