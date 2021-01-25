//
//  ZZDoubleListViewController.h
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//UITableViewDelegate

@protocol ZZDoubleListDelegate <NSObject>

-(CGRect)listView:(ZZ)

@end

@interface ZZDoubleViewController : UIViewController

@property(nonatomic,strong) UIViewController *mainController;
@property(nonatomic,strong) UIViewController *subController;
@end

NS_ASSUME_NONNULL_END
