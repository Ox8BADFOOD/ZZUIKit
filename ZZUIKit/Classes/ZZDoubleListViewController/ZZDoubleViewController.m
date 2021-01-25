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

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self == [super initWithCoder:coder]) {
        [self commonInit];
    }
    return self;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self == [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self commonInit];
    }
    return self;
}

-(void)commonInit{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)setMainController:(UIViewController *)mainController{
    _mainController = mainController;
    [self addChildViewController:mainController];
}

-(void)setSubController:(UIViewController *)subController{
    _subController = subController;
    [self addChildViewController:subController];
}
@end
