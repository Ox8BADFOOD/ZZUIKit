//
//  ZZDialog.h
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/12.
//

#import <UIKit/UIKit.h>
#import "ZZUIKitConst.h"
NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSUInteger, ZZDialogCancelPosition) {
    //一半在外边
    ZZDialogCancelPositionHalfOutside = 0,
    //在右上角
    ZZDialogCancelPositionTopRight,
    //再底部中间
    ZZDialogCancelPositionBottomOutside,
};

struct ZZDialogCancelMargin{
    CGFloat paddingTop;
    CGFloat paddingRight;
};

typedef struct CG_BOXABLE ZZDialogCancelMargin ZZDialogCancelMargin;

CG_INLINE ZZDialogCancelMargin
ZZDialogCancelMarginMake(CGFloat top, CGFloat right)
{
    ZZDialogCancelMargin margin;
    margin.paddingTop = top;
    margin.paddingRight = right;
    return margin;
}

@class ZZDialog;
@protocol ZZDialogContenDelegate<NSObject>
-(CGRect)preferredFrameForContentInDialog:(ZZDialog *)dialog;
-(__kindof UIView *)viewForContentInDialog:(ZZDialog *)dialog;
@end

@protocol ZZDialogHandleDelegate<NSObject>
-(CGRect)preferredFrameForHandleInDialog:(ZZDialog *)dialog;
-(NSArray<NSDictionary*> *)itemsForHandleInDialog:(ZZDialog *)dialog;

@end

@interface ZZDialog : UIView

@property(nonatomic,weak,nullable) id<ZZDialogContenDelegate> contentDelegate;
@property(nonatomic,weak,nullable) id<ZZDialogHandleDelegate> handleDelegate;
/// content的view
@property(nonatomic,strong) UIView *contentView;
@property(nonatomic,strong) UIStackView *handleView;


/// cancelImg cancelBtn 二选一
@property(nonatomic,strong,nullable) UIImage *cancelImg;

/// cancelBtn cancelBtn 二选一
@property(nonatomic,strong,nullable) UIButton *cancelBtn;
@property(nonatomic,assign) ZZDialogCancelMargin cancelMargin;
@property(nonatomic,assign) ZZDialogCancelPosition cancelPosition;

-(void)dismiss;
@end

NS_ASSUME_NONNULL_END
