//
//  ZZDoubleListViewController.h
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ZZDoubleViewController;

@protocol ZZDoubleViewControllerContainer <NSObject>
-(UIViewController *)mainController;
-(UIViewController *)subController;
-(CGRect)mainRect;
-(CGRect)subRect;
@end

@interface ZZDoubleViewController : UIViewController
@property(nonatomic,weak) id<ZZDoubleViewControllerContainer> delegate;
@end

NS_ASSUME_NONNULL_END
