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


@end
