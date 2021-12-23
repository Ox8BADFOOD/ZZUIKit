//
//  ZZTextInputWidget.h
//  ZZUIKit
//
//  Created by Max on 2021/4/6.
//

#import <FlexLib/FlexLib.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZTextInputWidget : FlexCustomBaseView

/// 占位文字
@property(nonatomic,copy) NSString *placehold;
@property(nonatomic,assign) NSInteger maxCount;
@property(nonatomic,assign,readonly) NSInteger currentCount;
/// 计数文字的格式化字符串
@property(nonatomic,copy,nullable) NSString *countFormat;
@property(nonatomic,copy) NSString *text;
@property(nonatomic,strong) FlexTextView *textView;

@end

NS_ASSUME_NONNULL_END
