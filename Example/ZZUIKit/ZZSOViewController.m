//
//  ZZSOViewController.m
//  ZZUIKit_Example
//
//  Created by Max on 2021/1/15.
//  Copyright © 2021 bymiracles@163.com. All rights reserved.
//

#import "ZZSOViewController.h"
#import <ZZUIKit/ZZSOView.h>
#import <ZZUIKitEx/ZZUIKitEx.h>
#import <ZZUIKit/ZZUIKitConst.h>
#import "ZZSOTableViewController1.h"
#import <ZZUIKit/ZZMaskViewController.h>
#import "ZZDoubleVC.h"
@interface ZZSOViewController ()<ZZSOContentDelegate>
@property(nonatomic,strong) ZZSOView *soView;
@property(nonatomic,strong) NSArray *itemArr;
@end

@implementation ZZSOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.soView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _itemArr = @[
            @{
                ZZTitleKey:@"综合1",
                ZZImgKey:[UIImage imageNamed:@"ic_tab_home_active"],
                ZZTitleColorKey:[UIColor redColor],
                ZZRotateKey:@"r"
            },
            @{
                ZZTitleKey:@"综合",
                ZZImgKey:[UIImage imageNamed:@"编组备份 3-1"],
                ZZImgSelectKey:[UIImage imageNamed:@"编组备份 3"],
                ZZTitleColorKey:[UIColor redColor],
            },
            @{
                ZZTitleKey:@"接诊量",
                ZZImgKey:[UIImage imageNamed:@"ic_launcher"],
                ZZTitleColorKey:[UIColor redColor],
            }
        ];
        [self.soView reloadData];
    });
}

#pragma mark -- delegate

-(NSInteger)numberOfZZSoItem{
    return _itemArr.count;
}

-(NSDictionary *)ZZSoView:(ZZSOView *)soView itemForIndex:(NSInteger)index{
    return _itemArr[index];
}

-(UIViewController *)ZZSoView:(ZZSOView *)soView controllerAtIndex:(NSInteger)index{
    if (index == 0){
        return [ZZSOTableViewController1 new];
    }else if (index == 2){
        return [ZZDoubleVC new];
    }
    return nil;
}

-(CGRect)ZZSoView:(ZZSOView *)soView rectForControllerAtIndex:(NSInteger)index{
    return CGRectMake(0 , NAV_STATUS_BAR_H() + soView.zz_height, SCREEN_W(), 300);
}

-(ZZSOView *)soView{
    if(!_soView){
        _soView = [[ZZSOView alloc] initWithFrame:CGRectMake(0, NAV_STATUS_BAR_H(), self.view.zz_width, 104)];
        _soView.delegate = self;
        _soView.maskVC = [[ZZMaskViewController alloc] initWithMaskColor:zz_RGBAHex(0xff0000, 0.5) alpha:0.85];
    }
    return _soView;
}

//-(NSTimeInterval)ZZSoView:(ZZSOView *)soView timeForControllerAnimaAtIndex:(NSInteger)index{
//    return 2;
//}
@end
