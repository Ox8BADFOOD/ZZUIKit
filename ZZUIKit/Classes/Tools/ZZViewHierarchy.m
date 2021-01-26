//
//  ZZViewHierarchy.m
//  InternetHospital
//
//  Created by Max on 2020/12/4.
//  Copyright © 2020 GaoLian. All rights reserved.
//

#import "ZZViewHierarchy.h"

@implementation ZZViewHierarchy
+ (UIViewController*)ZZCurrentViewController {
//    var window = UIApplication.shared.keyWindow
//    //是否为当前显示的window
//    if window?.windowLevel != UIWindow.Level.normal{
//        let windows = UIApplication.shared.windows
//        for  windowTemp in windows{
//            if windowTemp.windowLevel == UIWindow.Level.normal{
//                window = windowTemp
//                break
//            }
//        }
//    }
//
//    let vc = window?.rootViewController
//    return getTopVC(withCurrentVC: vc)
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    //是否为当前显示的window
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [UIApplication sharedApplication].windows;
        for (UIWindow *wd in windows) {
            if (wd.windowLevel == UIWindowLevelNormal) {
                window = wd;
                break;
            }
        }
    }
    UIViewController* vc = window.rootViewController;
    while (1) {
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController*)vc).visibleViewController;
        }
        else{
            break;
        }
    }
    return vc;
}


+ (UIViewController *)ZZRootViewController {
    UIViewController *RootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = RootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}
@end
