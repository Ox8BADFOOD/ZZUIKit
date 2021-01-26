//
//  ZZStackViewController.m
//  ZZUIKit_Example
//
//  Created by Max on 2021/1/14.
//  Copyright © 2021 bymiracles@163.com. All rights reserved.
//

#import "ZZStackViewController.h"
#import <ZZUIKit/ZZTextImgView.h>
#import <ZZUIKitEx/ZZUIKitEx.h>
#import <Masonry/Masonry.h>
@interface ZZStackViewController ()
@end

@implementation ZZStackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZZTextImgView *ziView = [[ZZTextImgView alloc] initWithDirection:ZZDirectionVertical widgetAlign:ZZTextImgAlignReverse];
//    _ziView.frame = CGRectMake(100, 100, 100, 100);
    ziView.lab.text = @"hello";
    ziView.imgV.image = [UIImage imageNamed:@"ic_tab_home_active"];
    [self.view addSubview:ziView];
    [ziView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view).centerOffset(CGPointMake( - SCREEN_W()/4, -SCREEN_H()/4));
    }];
    
    ZZTextImgView *ziView1 = [[ZZTextImgView alloc] initWithDirection:ZZDirectionVertical widgetAlign:ZZTextImgAlignNormal];
        ziView1.lab.text = @"hello";
        ziView1.imgV.image = [UIImage imageNamed:@"ic_tab_home_active"];
        [self.view addSubview:ziView1];
        [ziView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self.view).centerOffset(CGPointMake(SCREEN_W()/4, -SCREEN_H()/4));
        }];
    
    ZZTextImgView *ziView2 = [[ZZTextImgView alloc] initWithDirection:ZZDirectionHorizontal widgetAlign:ZZTextImgAlignNormal];
    ziView2.lab.text = @"hello";
    ziView2.imgV.image = [UIImage imageNamed:@"ic_tab_home_active"];
    [self.view addSubview:ziView2];
    [ziView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view).centerOffset(CGPointMake(- SCREEN_W()/4, SCREEN_H()/4));
    }];
    
    ZZTextImgView *ziView3 = [[ZZTextImgView alloc] initWithDirection:ZZDirectionHorizontal widgetAlign:ZZTextImgAlignReverse];
    ziView3.lab.text = @"hello";
    ziView3.imgV.image = [UIImage imageNamed:@"ic_tab_home_active"];
    [self.view addSubview:ziView3];
    [ziView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view).centerOffset(CGPointMake(SCREEN_W()/4, SCREEN_H()/4));
    }];
}


@end
