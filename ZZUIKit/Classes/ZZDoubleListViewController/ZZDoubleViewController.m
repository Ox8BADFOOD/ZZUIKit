//
//  ZZDoubleListViewController.m
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/14.
//

#import "ZZDoubleViewController.h"

@interface ZZDoubleViewController ()

@end

@implementation ZZDoubleViewController

-(void)setDelegate:(id<ZZDoubleViewControllerContainer>)delegate{
    _delegate = delegate;
    //mainController
    UIViewController *mainController = [delegate mainController];
    [self addChildViewController:mainController];
    
    mainController.view.frame = [delegate mainRect];
    [self.view addSubview:mainController.view];
    
    [mainController didMoveToParentViewController:self];
    
    //subController
    UIViewController *subController = [delegate subController];
    [self addChildViewController:subController];
    
    subController.view.frame = [delegate subRect];
    [self.view addSubview:subController.view];
    
    [subController didMoveToParentViewController:self];
}
@end
