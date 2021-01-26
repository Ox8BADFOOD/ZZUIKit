//
//  UITabBarController+Appearance.h
//  meimeika
//
//  Created by ZZBB on 2019/12/31.
//  Copyright © 2019 sun. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBarController (ZZEx)
-(void)zz_hideShadowImg;
- (void)zz_scaleAnimationWithIndex:(NSInteger) index from:(NSNumber *)fromNum to:(NSNumber *)toNum;
@end

NS_ASSUME_NONNULL_END
