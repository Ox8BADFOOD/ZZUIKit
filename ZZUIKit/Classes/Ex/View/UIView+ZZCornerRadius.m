//
//  UIView+ZZCornerRadius.m
//  meimeika
//
//  Created by bym on 2019/10/12.
//  Copyright © 2019 sun. All rights reserved.
//

#import "UIView+ZZCornerRadius.h"
#import <objc/runtime.h>


@implementation UIView (ZZCornerRadius)

#pragma mark - CoreRadius
-(void)ZZCornerRadiusByRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii layerRect:(CGRect)layerRect{
	CGRect oldRect = layerRect;
	UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:oldRect byRoundingCorners:corners cornerRadii:cornerRadii];
	CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
	maskLayer.path = maskPath.CGPath;
	maskLayer.frame = oldRect;
	self.layer.mask = maskLayer;
}

-(void)ZZCornerRadiusByRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii{
	CGRect oldRect = self.bounds;
	UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:oldRect byRoundingCorners:corners cornerRadii:cornerRadii];
	CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
	maskLayer.path = maskPath.CGPath;
	maskLayer.frame = oldRect;
	self.layer.mask = maskLayer;
}

- (void)setZZIBCornerRadius:(CGFloat)cornerRadius {
    objc_setAssociatedObject(self, @selector(cornerRadius), @(cornerRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (CGFloat)ZZIBCornerRadius {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

#pragma mark - BorderWidth
- (void)setZZIBBorderWidth:(CGFloat)borderWidth {
    objc_setAssociatedObject(self, @selector(borderWidth), @(borderWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.layer.borderWidth = borderWidth;
    self.layer.masksToBounds = YES;
}

- (CGFloat)ZZIBBorderWidth {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

#pragma mark - BoderColor
- (void)setZZIBBorderColor:(UIColor *)borderColor {
    objc_setAssociatedObject(self, @selector(borderColor),borderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)ZZIBBorderColor {
    return objc_getAssociatedObject(self, _cmd);
}
@end
