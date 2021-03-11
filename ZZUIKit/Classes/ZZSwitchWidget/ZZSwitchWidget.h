//
//  ZZSwitchWidget.h
//  ZZUIKit
//
//  Created by Max on 2021/3/3.
//

#import <FlexLib/FlexLib.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZSwitchWidget : FlexCustomBaseView
/// 文字
@property(nonatomic,strong) UILabel *title;

/// 开关
@property(nonatomic,strong) UISwitch *toggle;

/// 开关
@property(nonatomic,strong) UILabel *toggleLabel;
@property(nonatomic,strong) UILabel *toggleOffLabel;
@end

NS_ASSUME_NONNULL_END
