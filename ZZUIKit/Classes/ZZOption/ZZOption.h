//
//  ZZOption.h
//  ZZUIKit
//
//  Created by Max on 2021/3/9.
//

#import <FlexLib/FlexLib.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZOption : FlexCustomBaseView
/// 选中的状态
@property(nonatomic,assign) BOOL selected;
/// 能不能反转
@property(nonatomic,assign) BOOL reverse;
/// 点击回调blcok
@property(nonatomic,copy) void(^clickEvent)(ZZOption *box);

/// 文本
@property(nonatomic,strong) UILabel *titleLab;
#pragma mark -- 无图片的属性
/// 选中的背景色
@property(nonatomic,copy) NSString *selBgc;
@property(nonatomic,copy) NSString *unselBgc;
@property(nonatomic,copy) NSString *selBorderColor;
@property(nonatomic,copy) NSString *unselBorderColor;
/// 选中文字的颜色
@property(nonatomic,copy) NSString *selTextColor;
@property(nonatomic,copy) NSString *unselTextColor;

/// 发送radio广播
-(void)postRadioNotification;
@end

NS_ASSUME_NONNULL_END
