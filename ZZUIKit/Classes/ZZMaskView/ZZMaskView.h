//
//  ZZMaskView.h
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface ZZMaskView : UIView

@property(nonatomic,assign) UIBlurEffectStyle blurStyle;
@property(nonatomic,strong) UIColor *maskColor;
@end

NS_ASSUME_NONNULL_END
