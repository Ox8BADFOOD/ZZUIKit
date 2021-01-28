//
//  ZZFont.h
//  ShareBeauty
//
//  Created by ZZBB on 2020/8/8.
//  Copyright © 2020 yuepinyuemei. All rights reserved.
//

#import <UIKit/UIKit.h>
#ifndef ZZFont_h
#define ZZFont_h

///苹方-简 常规体
#define PFRegularName 	@"PingFangSC-Regular"
///苹方-简 中黑体
#define PFMediumName 	@"PingFangSC-Medium"
///苹方-简 中粗体
#define PFSemiboldName 	@"PingFangSC-Semibold"

//#define PFFont(name,size) [UIFont fontWithName:name size:size]
//#define PFRegular(size) [UIFont fontWithName:PFRegularName size:size]
//#define PFMedium(size) [UIFont fontWithName:PFMediumName size:size]
//#define PFBold(size) [UIFont fontWithName:PFSemiboldName size:size]

FOUNDATION_EXPORT UIFont * zz_PFFont(CGFloat size);
FOUNDATION_EXPORT UIFont * zz_PFMediumFont(CGFloat size);
FOUNDATION_EXPORT UIFont * zz_PFBoldFont(CGFloat size);
#endif /* ZZFont_h */
