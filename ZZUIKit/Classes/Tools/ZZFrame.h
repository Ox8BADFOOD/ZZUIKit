//
//  ZZFrame.h
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/11.
//

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT CGFloat SCREEN_H(void);
FOUNDATION_EXPORT CGFloat SCREEN_W(void);
FOUNDATION_EXPORT bool is_X_like(void);

FOUNDATION_EXPORT CGFloat STATUS_BAR_H(void);
FOUNDATION_EXPORT CGFloat NAV_BAR_H(void);
FOUNDATION_EXPORT CGFloat NAV_STATUS_BAR_H(void);

FOUNDATION_EXPORT CGFloat TABBER_BAR_H(void);
FOUNDATION_EXPORT CGFloat BOTTOM_PADDING(void);

//375设计图屏幕比例缩放
FOUNDATION_EXPORT CGFloat zz_adapt(CGFloat value);
//按照给定比例缩放
FOUNDATION_EXPORT CGFloat zz_adaptRatio(CGFloat origin,CGFloat ratio);

FOUNDATION_EXPORT CGFloat zz_screenOriginY(void);
