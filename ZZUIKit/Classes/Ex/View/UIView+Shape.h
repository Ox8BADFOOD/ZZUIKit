//
//  UIView+Shape.h
//  IHWristband
//
//  Created by Max on 2021/12/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Shape)
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;
@end

NS_ASSUME_NONNULL_END
