//  Created by MAX on 2018/11/2.
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZTextWidget : UITextView

@property (copy, nonatomic) NSString *placeholder;
@property (assign, nonatomic) NSInteger maxLength;//最大长度
@property (strong, nonatomic) UILabel *placeholderLabel;
@property (strong, nonatomic) UILabel *wordNumLabel;

//文字输入
@property (copy, nonatomic) void(^didChangeText)(ZZTextWidget *textView);
- (void)didChangeText:(void(^)(ZZTextWidget *textView))block;

@end

NS_ASSUME_NONNULL_END
