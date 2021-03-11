//
//  ZZRadio.h
//  ZZUIKit
//
//  Created by Max on 2021/3/3.
//

#import <ZZUIKit/ZZCheckBox.h>
#import <ZZUIKit/UIView+ZZEx.h>

#define ZZRadioNotification(label) [NSString stringWithFormat:@"%pRadioNotification%@",[self zz_viewController],label]

NS_ASSUME_NONNULL_BEGIN

/// 同一个页面不相干的label不要重复使用
@interface ZZRadio : FlexCustomBaseView
@property(nonatomic,copy,nullable) NSString * selectStr;
@property(nonatomic,copy,nullable) void(^selectedBlock)(NSString * nullable);
@end

NS_ASSUME_NONNULL_END
