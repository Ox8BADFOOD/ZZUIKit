//
//  ZZMaskViewController.h
//  Aspects
//
//  Created by Max on 2021/1/18.
//

#import <ZZUIKit/ZZViewController.h>
#import "ZZMaskView.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZZMaskViewController : ZZViewController
-(instancetype)initWithBlurStyle:(UIBlurEffectStyle)style alpha:(CGFloat)alpha NS_DESIGNATED_INITIALIZER;
-(instancetype)initWithMaskColor:(UIColor *)color  alpha:(CGFloat)alpha NS_DESIGNATED_INITIALIZER;
@end

NS_ASSUME_NONNULL_END
