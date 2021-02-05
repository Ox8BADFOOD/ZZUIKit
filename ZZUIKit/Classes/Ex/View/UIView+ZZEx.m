//
//  UIView+ZZEx.m
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/7.
//

#import "UIView+ZZEx.h"

@implementation UIView (ZZEx)


- (UIViewController *)zz_viewController {
    id nextResponder = [self nextResponder];
    while (nextResponder != nil) {
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            UIViewController *vc = (UIViewController *)nextResponder;
            return vc;
        }
        nextResponder = [nextResponder nextResponder];
    }
    return nil;
}

-(void)zz_cornerRadiusByRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii layerRect:(CGRect)layerRect{
    CGRect oldRect = layerRect;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:oldRect byRoundingCorners:corners cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = maskPath.CGPath;
    maskLayer.frame = oldRect;
    self.layer.mask = maskLayer;
}

-(void)zz_cornerRadiusByRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii{
    CGRect oldRect = self.bounds;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:oldRect byRoundingCorners:corners cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = maskPath.CGPath;
    maskLayer.frame = oldRect;
    self.layer.mask = maskLayer;
}

/******************/

 +(UIView *(^)(void))ZZNew{
    return ^UIView*(void){
        return [self new];
    };
}

+ (UIView *(^)(NSString *))ZZLoadNibName{
    return ^UIView*(NSString *ZNibName){
        return [[[NSBundle mainBundle] loadNibNamed:ZNibName owner:nil options:nil] firstObject];
    };
};

+ (UIView *(^)(CGRect))ZZFrameInit{
    return ^UIView*(CGRect rect){
        return [[self alloc] initWithFrame:rect];
    };
}

- (UIView *(^)(CGRect))ZZSetFrame{
    return ^UIView*(CGRect rect){
        self.frame = rect;
        return self;
    };
}

- (UIView *(^)(UIColor *))ZZBgc{
    return ^UIView *(UIColor *color) {
        self.backgroundColor = color;
        return self;
    };
}

- (UIView *(^)(UIColor *))ZZBorderColor {
    return ^UIView *(UIColor *color) {
        self.layer.borderColor = color.CGColor;
        return self;
    };
}

- (UIView *(^)(bool))ZZClip {
    return ^UIView *(bool mask) {
        self.layer.masksToBounds = mask;
        return self;
    };
}

- (UIView *(^)(CGFloat))ZZBorderWidth {
    return ^UIView *(CGFloat width) {
        self.layer.borderWidth = width;
        return self;
    };
}

- (UIView *(^)(CGFloat))ZZCornerRadius {
    return ^UIView *(CGFloat radius) {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = true;
        return self;
    };
}

-(UIView *(^)(BOOL))ZZUserInteraction{
    return ^UIView *(BOOL enable){
        self.userInteractionEnabled = enable;
        return self;
    };
};

-(UIView *(^)(BOOL))ZZAutoresizesSubviews{
    return ^UIView *(BOOL enable){
        self.autoresizesSubviews = enable;
        return self;
    };
}

-(UIView *(^)(CGFloat))ZZAlpha{
    return ^UIView *(CGFloat zalpha){
        self.alpha = zalpha;
        return self;
    };
}

-(UIView *(^)(BOOL))ZZHidden{
    return ^UIView *(BOOL enable){
        self.hidden = enable;
        return self;
    };
}

-(UIView *(^)(UIView *))ZZMaskView{
    return ^UIView *(UIView *maskV){
        self.maskView = maskV;
        return self;
    };
}

-(UIView *(^)(void))ZZClearSubview{
    return ^UIView *(void){
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj removeFromSuperview];
        }];
        return self;
    };
};

-(UIView *(^)(UIView *))ZZAddSubview{
    return ^UIView *(UIView *v){
        [self addSubview:v];
        return self;
    };
};

-(UIView *(^)(UIView *))ZZBringSubviewToFront{
    return ^UIView *(UIView *v){
        [v bringSubviewToFront:self];
        return self;
    };
};
@end
