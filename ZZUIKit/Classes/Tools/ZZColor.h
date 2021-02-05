//
//  ZZColor.h
//  ShareBeauty
//
//  Created by ZZBB on 2020/8/8.
//  Copyright © 2020 yuepinyuemei. All rights reserved.
//
#import <UIKit/UIKit.h>

#ifndef ZZColor_h
#define ZZColor_h

FOUNDATION_EXPORT UIColor* zz_RGBA(float r,float g,float b,float a);
/// rgb初始化Color
FOUNDATION_EXPORT UIColor* zz_RGB(float r,float g,float b);

/// hex转成UIColor的数组(float值)
FOUNDATION_EXPORT NSArray* zz_HexToRGB(long hex);

/// hex初始化Color
FOUNDATION_EXPORT UIColor* zz_RGBHex(long hex);

/// hex带alpha初始化Color
FOUNDATION_EXPORT UIColor* zz_RGBAHex(long hex,float alpha);

/// 随机Color
FOUNDATION_EXPORT UIColor* zz_RGBRandom(void);
#endif /* ZZColor_h */
