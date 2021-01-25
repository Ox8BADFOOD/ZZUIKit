//
//  ZZFlexViewController.m
//  ZZUIKit_Example
//
//  Created by Max on 2021/1/20.
//  Copyright © 2021 bymiracles@163.com. All rights reserved.
//

#import "ZZFlexViewController.h"
#import "FlexHttpVC.h"
#import "ZZPrecentItem.h"
#import "ZZNaviBar.h"
#import "ZZPointBar.h"
#import <ZZUIKit/ZZUIKitConst.h>
#import <ZZUIKitEx/ZZUIKitEx.h>
@interface ZZFlexViewController ()
{
    UILabel *_lab1;
    UILabel *_lab2;
    ZZNaviBar *_bottomNav;
}
@property(nonatomic,strong) ZZPointBar *pointBar;
@end

@implementation ZZFlexViewController

-(void)loadView{
    [[FlexStyleMgr instance] removeAllClassStyles];
    NSString* path1 = [[NSBundle mainBundle]pathForResource:@"system" ofType:@"style"];
    [[FlexStyleMgr instance]loadClassStyle:path1];
    NSString* path = [[NSBundle mainBundle]pathForResource:@"ZZFlexViewController" ofType:@"style"];
    [[FlexStyleMgr instance]loadClassStyle:path];
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    _lab1.text = @"hello world";
//    [UIView animateWithDuration:1 animations:^{
//            [_lab1 setLayoutAttr:@"height" Value:@"100"];
//            [_lab1 setLayoutAttr:@"width" Value:@"300"];
//            [self.rootView layoutIfNeeded];
//        }];
    _bottomNav.barNavsBlock = ^(int index) {
        switch (index) {
            default:
                NSLog(@"hei 你点击了第%i个",index);
                break;
        }
    };
    
    _pointBar.items = @[
                        @{ZZBgcKey:@"#44E8CA",},
                        @{ZZBgcKey:@"#FFEC4A",},
                        @{ZZBgcKey:@"#FFCA38",},
                        @{ZZBgcKey:@"#FF943D",},
                        @{ZZBgcKey:@"#FF5358",},
                       ];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        _bottomNav.hidden = true;
        _bottomNav.view1.hidden = true;
    });
}



- (IBAction)refresh:(id)sender {
    [FlexHttpVC presentInVC:self];
}


@end
