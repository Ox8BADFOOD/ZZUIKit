//
//  ZZTransitioningDelegate.m
//  meimeika
//
//  Created by ZZBB on 2020/2/22.
//  Copyright © 2020 sun. All rights reserved.
//

#import "ZZTransitioningDelegate.h"

@interface ZZTransitioningDelegate()
@property (nonatomic, assign) BOOL isPresnted;
@property (nonatomic, assign) NSTimeInterval transitionDuration;
@property (nonatomic, assign) ZZTransitionType transitionType;
@property (nonatomic, assign) CGRect showFrame;
@end

@implementation ZZTransitioningDelegate
-(instancetype)initWithTransitionType:(ZZTransitionType)type duration:(NSTimeInterval)duration showFrame:(CGRect)showFrame{
	if (self == [super init]) {
		_transitionDuration = duration;
		_transitionType = type;
		_showFrame = showFrame;
	}
	return self;
}

//MARK: - UIViewControllerTransitioningDelegate
//确定谁负责弹出动画
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
	self.isPresnted = YES;
	return self;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.isPresnted = NO;
    return self;
}

//MARK: -UIViewControllerAnimatedTransitioning
// This is used for percent driven interactive transitions, as well as for
// container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
	return _transitionDuration;
};

// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (self.isPresnted == YES) {
		//1.取出view
		UIView *presentedView = [transitionContext viewForKey:UITransitionContextToViewKey];
		presentedView.frame = _showFrame;
		//2.放入containerView
		[[transitionContext containerView]addSubview:presentedView];
		switch (_transitionType) {
			case ZZTransitionTypeNone:{
				[transitionContext completeTransition:YES];
			}
			break;
				
			case ZZTransitionTypeFade:{
					//3.设置基本属性
					presentedView.alpha = 0;
					//4.动画
					[UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
						presentedView.alpha = 1.0;
					}completion:^(BOOL finished) {
						[transitionContext completeTransition:YES];
					}];
			}
			break;
			default:
			break;
		}
        
        
    } else {
		//1.取出view
		UIView *dismissedView = [transitionContext viewForKey:UITransitionContextFromViewKey];
		//2.放入containerView
		[[transitionContext containerView]addSubview:dismissedView];
		switch (_transitionType) {
			case ZZTransitionTypeNone:{
				[transitionContext completeTransition:YES];
			}
			break;
				
			case ZZTransitionTypeFade:{
				//3.设置基本属性
				dismissedView.alpha = 1;
				//4.动画
				[UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
					dismissedView.alpha = 0;
				}completion:^(BOOL finished) {
					[transitionContext completeTransition:YES];
				}];
			}
				break;
				
			default:
				break;
		}
        
    }
}
@end
