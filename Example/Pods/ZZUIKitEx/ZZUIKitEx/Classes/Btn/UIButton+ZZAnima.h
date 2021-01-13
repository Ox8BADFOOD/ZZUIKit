//
//  UIButton+ZZAnima.h
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (ZZAnima)
@property(nonatomic,assign) BOOL zz_imgRotated;
-(void)zz_imgAnmimaRotate;
-(void)zz_imgAnmimaRotateDuration:(NSTimeInterval)duration;
@end

NS_ASSUME_NONNULL_END
