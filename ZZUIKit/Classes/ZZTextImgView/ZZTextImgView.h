//
//  ZZTextImgView.h
//  Pods
//
//  Created by Max on 2021/1/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZZDirection) {
    ZZDirectionHorizontal = UILayoutConstraintAxisHorizontal,
    ZZDirectionVertical = UILayoutConstraintAxisVertical,
};

typedef NS_ENUM(NSUInteger, ZZTextImgAlign) {
    //图片在前文字在后
    ZZTextImgAlignNormal = 0,
    ZZTextImgAlignReverse,
};

@interface ZZTextImgView : UIStackView
-(instancetype)initWithDirection:(ZZDirection)direction widgetAlign:(ZZTextImgAlign)widgetAlign;
//主轴方向
@property(nonatomic,assign,readonly) ZZDirection direction;
//排列方式
@property(nonatomic,assign,readonly) ZZTextImgAlign widgetAlign;
@property(nonatomic,strong) UIStackView *inner;
@property(nonatomic,strong) UILabel *lab;
@property(nonatomic,strong) UIImageView *imgV;
@end

NS_ASSUME_NONNULL_END
