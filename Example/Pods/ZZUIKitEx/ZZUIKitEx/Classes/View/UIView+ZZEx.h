//
//  UIView+ZZEx.h
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/7.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZZEx)


/// 获取视图的控制器
- (UIViewController *)zz_viewController;

/**
/// 图层可选的倒角
@param corners 圆角枚举
@param cornerRadii 圆角大小
*/
-(void)zz_cornerRadiusByRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;

/**
 /// 自定义图层大小的圆角
 @param corners 圆角枚举
 @param cornerRadii 圆角大小
 @param layerRect 图层大小
 */
-(void)zz_cornerRadiusByRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii layerRect:(CGRect)layerRect;


-(void)zz_recursionClearSubviewType:(Class)class;
@end

NS_ASSUME_NONNULL_END
