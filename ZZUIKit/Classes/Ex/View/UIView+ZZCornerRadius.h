//
//  UIView+ZZCornerRadius.h
//  meimeika
//
//  Created by bym on 2019/10/12.
//  Copyright © 2019 sun. All rights reserved.
//


#import <UIKit/UIKit.h>
IB_DESIGNABLE
NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZZCornerRadius)
@property (nonatomic, assign) IBInspectable CGFloat ZZIBCornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat ZZIBBorderWidth;
@property (nonatomic, strong) IBInspectable UIColor *ZZIBBorderColor;

/**
/// 图层可选的倒角
@param corners 圆角枚举
@param cornerRadii 圆角大小
*/
-(void)ZZCornerRadiusByRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;

/**
 /// 自定义图层大小的圆角
 @param corners 圆角枚举
 @param cornerRadii 圆角大小
 @param layerRect 图层大小
 */
-(void)ZZCornerRadiusByRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii layerRect:(CGRect)layerRect;
@end

NS_ASSUME_NONNULL_END
