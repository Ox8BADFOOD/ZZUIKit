//
//  UITabBarController+ZZEx.m
//  meimeika
//
//  Created by ZZBB on 2019/12/31.
//  Copyright © 2019 sun. All rights reserved.
//

#import "UITabBarController+ZZEx.h"
#import "ZZExFrame.h"


@implementation UITabBarController (ZZEx)
-(void)zz_hideShadowImg{
	CGRect rect = CGRectMake(0, 0, SCREEN_W(), SCREEN_H());
	UIGraphicsBeginImageContext(rect.size);
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
	CGContextFillRect(context, rect);
	UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	if (@available(iOS 13.0, *)) {
		UITabBarAppearance *tabBarAppearance = [self.tabBar.standardAppearance copy];
		[tabBarAppearance setBackgroundImage:img];
		[tabBarAppearance setShadowColor:[UIColor clearColor]];
		[self.tabBar setStandardAppearance:tabBarAppearance];
	} else {
		[self.tabBar setBackgroundImage:img];
		[self.tabBar setShadowImage:img];
	}
}

- (void)zz_scaleAnimationWithIndex:(NSInteger) index from:(NSNumber *)fromNum to:(NSNumber *)toNum{
    NSMutableArray <UIView *>* tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.09;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue = fromNum;
    pulse.toValue= toNum;
    [[tabbarbuttonArray[index] layer] addAnimation:pulse forKey:nil];
}
@end
