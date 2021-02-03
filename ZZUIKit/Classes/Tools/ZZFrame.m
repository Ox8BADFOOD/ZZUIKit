//
//  ZZFrame.m
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/11.
//

#import "ZZFrame.h"
#import <ZZUIKit/ZZUIKitTools.h>

CGFloat SCREEN_H(){
    return [UIScreen mainScreen].bounds.size.height;
}

CGFloat SCREEN_W(){
    return [UIScreen mainScreen].bounds.size.width;
};

bool is_X_like(void){
    BOOL isBangsScreen = NO;
    if (@available(iOS 11.0, *)) {
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    isBangsScreen = window.safeAreaInsets.bottom > 0;
    }
    return isBangsScreen;
}

CGFloat NAV_BAR_H(void){
    return 44;
};

CGFloat STATUS_BAR_H(void){
    return is_X_like() ? 44 : 20;
};

CGFloat NAV_STATUS_BAR_H(void){
    return NAV_BAR_H() + STATUS_BAR_H();
}

CGFloat TABBER_BAR_H(void){
    return is_X_like() ? 83 : 49;
};

CGFloat BOTTOM_PADDING(void){
    return is_X_like() ? 34 : 0;
}

//屏幕缩放比例
CGFloat zz_adapt(CGFloat value){
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat ratio = screenW/375.0;
    return zz_adaptRatio(value,ratio);
}

CGFloat zz_adaptRatio(CGFloat origin,CGFloat ratio){
    return origin * ratio;
}

//屏幕y0点
CGFloat zz_screenOriginY(void){
    return [ZZViewHierarchy ZZCurrentViewController].navigationController.navigationBar.translucent ? NAV_STATUS_BAR_H() : 0;
}
