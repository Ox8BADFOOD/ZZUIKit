//
//  ZZSOView.h
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/15.
//

#import <UIKit/UIKit.h>
#import "ZZUIKitConst.h"
#import "ZZMaskViewController.h"
NS_ASSUME_NONNULL_BEGIN
@class ZZSOView;
@protocol ZZSOContentDelegate <NSObject>

-(NSInteger)numberOfZZSoItem;
-(NSDictionary *)ZZSoView:(ZZSOView *)soView itemForIndex:(NSInteger)index;

-(UIViewController *)ZZSoView:(ZZSOView *)soView controllerAtIndex:(NSInteger)index;
-(CGRect)ZZSoView:(ZZSOView *)soView rectForControllerAtIndex:(NSInteger)index;

@optional
-(NSTimeInterval)ZZSoView:(ZZSOView *)soView timeForControllerAnimaAtIndex:(NSInteger)index;

/// 点击了第index项
/// @param soView <#soView description#>
/// @param index <#index description#>
-(void)ZZSoView:(ZZSOView *)soView didClickItemAtIndex:(NSInteger)index;
@end

@interface ZZSOView : UIView
@property(nonatomic,weak) id<ZZSOContentDelegate> delegate;
@property(nonatomic,strong) ZZMaskViewController *maskVC;
-(void)reloadData;
-(void)dismiss;
-(void)showLast;
@end

NS_ASSUME_NONNULL_END
