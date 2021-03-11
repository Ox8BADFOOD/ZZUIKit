//
//  ZZCheckBox.h
//  ZZUIKit
//
//  Created by Max on 2021/3/3.
//

#import <FlexLib/FlexLib.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZCheckBox : FlexCustomBaseView

/// 选中的状态
@property(nonatomic,assign) BOOL selected;
/// 能不能反转
@property(nonatomic,assign) BOOL reverse;
/// 点击回调blcok
@property(nonatomic,copy) void(^clickEvent)(ZZCheckBox *box);
/// 图片控件；无图片的时候隐藏
@property(nonatomic,strong) UIImageView *imgV;
/// 文本
@property(nonatomic,strong) UILabel *title;
/// xml创建的View
@property(nonatomic,strong) UIView *wrapper;

//#pragma mark -- 无图片的属性
///// 选中的背景色
//@property(nonatomic,copy) NSString *selBgc;
//@property(nonatomic,copy) NSString *unselBgc;
//@property(nonatomic,copy) NSString *selBorderColor;
//@property(nonatomic,copy) NSString *unselBorderColor;
//#pragma mark -- 有图片的属性
@property(nonatomic,strong) UIImage *selImg;
@property(nonatomic,strong) UIImage *unselImg;
/// 发送radio广播
-(void)postRadioNotification;
@end

NS_ASSUME_NONNULL_END
