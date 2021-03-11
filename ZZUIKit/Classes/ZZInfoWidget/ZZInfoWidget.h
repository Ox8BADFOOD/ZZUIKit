//
//  ZZInfoWidget.h
//  ZZUIKit
//
//  Created by Max on 2021/3/3.
//

#import <FlexLib/FlexLib.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZInfoWidget : FlexCustomBaseView
/// 标题
@property(nonatomic,strong) UILabel *title;
/// 输入框
@property(nonatomic,strong) UITextField *field;
/// title 和 field的容器
@property(nonatomic,strong) UIView *contentWrapper;
/// 下划线
@property(nonatomic,strong) UIView *line;
@end

NS_ASSUME_NONNULL_END
