//
//  ZZViewHierarchy.h
//  InternetHospital
//
//  Created by Max on 2020/12/4.
//  Copyright © 2020 GaoLian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZViewHierarchy : NSObject
+ (UIViewController*)ZZCurrentViewController;

+ (UIViewController *)ZZRootViewController;
@end

NS_ASSUME_NONNULL_END
