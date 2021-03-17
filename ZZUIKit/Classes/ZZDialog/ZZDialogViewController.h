//
//  ZZDialogViewController.h
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/13.
//

#import <ZZUIKit/ZZViewController.h>
#import "ZZDialog.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ZZDialogDelegate <ZZDialogContenDelegate>
-(CGRect)preferredFrameForDialog:(ZZDialog *)dialog;

@end

@interface ZZDialogViewController : ZZViewController
@property(nonatomic,strong,readonly) ZZDialog *dialog;
@property(nonatomic,weak,nullable) id<ZZDialogDelegate> dialogDelegate;
@property(nonatomic,weak,nullable) id<ZZDialogHandleDelegate> handleDelegate;

@property(nonatomic,strong) UIColor *maskColor;
@property(nonatomic,assign) UIBlurEffectStyle blurStyle;

@end

NS_ASSUME_NONNULL_END
