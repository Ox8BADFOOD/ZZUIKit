//
//  UIView+ZZGesture.h
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/7.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

typedef void(^ZZTapActionBlock)(UIView *view);

@interface UIView (ZZGesture)

@property (nonatomic, copy) ZZTapActionBlock zz_tapBlock;
@property(nonatomic,copy) ZZTapActionBlock zz_longTapBlock;

//单点行为
-(UIView *(^) (ZZTapActionBlock))zz_tapAction;

//长按行为
-(UIView *(^) (ZZTapActionBlock))zz_longTapAction;
@end

NS_ASSUME_NONNULL_END
