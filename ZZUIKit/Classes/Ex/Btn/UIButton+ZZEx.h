//
//  UIButton+ZZEx.h
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/7.
//

#import <UIKit/UIKit.h>
#import "UIControl+ZZEx.h"
//typedef void(^ZZButtonEventsBlock)(UIButton *_Nullable);
NS_ASSUME_NONNULL_BEGIN

@interface UIButton (ZZEx)

///背景色字典
@property (nonatomic, strong) NSMutableDictionary<NSNumber *,UIColor *> *zz_bgc;

-(void)setZz_backgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;
-(UIColor *)zz_backgroundColorForState:(UIControlState)state;

/// btn的点击事件；返回值是blcok1，block1的返回值是btn，block的参数是点击事件
- (UIButton *(^)(ZZControlEventsBlock))zz_click;

/// 文字 系统space 图片
- (void)zz_contentReverse_simple;


/// 图片 space 文字
- (void)zz_contentNormal:(CGFloat)space;
/// 文字 space 图片
- (void)zz_contentReverse:(CGFloat)space;
/// 垂直方向上图片 space 文字
- (void)zz_contentUpsidedown:(CGFloat)space;
/// 垂直方向上文字 space 图片
- (void)zz_contentDownsideup:(CGFloat)space;

/*****************************************/

+ (UIButton *(^)(UIButtonType))ZZButton;
- (UIButton *(^)(NSAttributedString *title, UIControlState status))ZZAttributedTitle;
// 设置按钮的标题
- (UIButton *(^)(NSString *title,UIControlState status))ZZTitle;
// 设置按钮背景图
- (UIButton *(^)(UIImage *backgroundImage,UIControlState status))ZZBgImage;
//设置按钮的背景色
- (UIButton *(^)(UIColor *color))ZZBgc;
//这只按钮的边框
- (UIButton *(^)(UIColor *borderColor,CGFloat borderWidth))ZZBorder;
// 设置按钮的标题颜色
- (UIButton *(^)(UIColor *titleColor))ZZTitleColor;
- (UIButton *(^)(UIColor *,UIControlState))ZZTitleColor2;
// 设置按钮的setImage
- (UIButton *(^)(UIImage *image,UIControlState status))ZZShowImage;
- (UIButton *(^)(UIViewContentMode mode))ZZShowImageContentMode;
// 设置按钮的frame
- (UIButton *(^)(CGRect frame))ZZSetFrame;

- (UIButton *(^)(UIFont *font))ZZFont;
- (UIButton *(^)(CGFloat))ZZCornerRadius;
@end

NS_ASSUME_NONNULL_END
