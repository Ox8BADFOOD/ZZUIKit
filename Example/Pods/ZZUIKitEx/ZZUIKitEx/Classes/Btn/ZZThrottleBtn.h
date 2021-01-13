//
//  ZZThrottleBtn.h
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/8.
//

#import <UIKit/UIKit.h>
#import "UIButton+ZZEx.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZZThrottleBtn : UIButton
/// event触发节流
@property(nonatomic,assign) NSInteger zz_throttleDuration;
@property(nonatomic,assign) UIControlState zz_throttleState;
@end

NS_ASSUME_NONNULL_END
