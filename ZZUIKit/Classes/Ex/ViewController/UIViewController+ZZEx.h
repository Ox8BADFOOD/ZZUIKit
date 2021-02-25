//
//  UIViewController+ZZEx.h
//  ZZUIKit
//
//  Created by Max on 2021/2/23.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (ZZEx)

@property(nonatomic,copy) void(^zz_viewDidLoadBlock)(__kindof UIViewController *vc);
@property(nonatomic,copy) void(^zz_viewWillAppearBlock)(__kindof UIViewController *vc);
@property(nonatomic,copy) void(^zz_viewDidAppearBlock)(__kindof UIViewController *vc);
@property(nonatomic,copy) void(^zz_viewWillLayoutSubviewsBlock)(__kindof UIViewController *vc);
@property(nonatomic,copy) void(^zz_viewDidLayoutSubviewsBlock)(__kindof UIViewController *vc);

@end

NS_ASSUME_NONNULL_END
