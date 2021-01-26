//
//  ZZTransitioningDelegate.h
//  meimeika
//
//  Created by ZZBB on 2020/2/22.
//  Copyright © 2020 sun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZZTransitionType) {
	ZZTransitionTypeNone = 0,
	//淡入淡出
	ZZTransitionTypeFade = 1,
};

@interface ZZTransitioningDelegate : NSObject<UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning>
-(instancetype)initWithTransitionType:(ZZTransitionType)type duration:(NSTimeInterval)duration showFrame:(CGRect)showFrame;
@end

NS_ASSUME_NONNULL_END
