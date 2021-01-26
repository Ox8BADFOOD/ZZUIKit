//
//  UIControl+ZZEx.h
//  Pods
//
//  Created by Max on 2021/1/8.
//

#import <UIKit/UIKit.h>
typedef void(^ZZControlEventsBlock)(UIControl *_Nullable);
NS_ASSUME_NONNULL_BEGIN

@interface UIControl (ZZEx)
/// 预期的selector
- (SEL)zz_expectSelector;
/// 预期的target,只在target只有一个的时候准确
- (id)zz_expectTarget;

/** 事件回调的block */
@property (nonatomic, copy) ZZControlEventsBlock zz_eventBlock;
// 添加触发事件
- (UIControl *(^)(ZZControlEventsBlock block,UIControlEvents events))zz_eventFire;
@end

NS_ASSUME_NONNULL_END
