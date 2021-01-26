//
//  ZZItemInfoController.m
//  ZZUIKit_Example
//
//  Created by Max on 2021/1/19.
//  Copyright © 2021 bymiracles@163.com. All rights reserved.
//

#import "ZZItemInfoController.h"
#import <ZZUIKit/ZZUIKitEx.h>
#import <ZZUIKit/ZZInfoItem.h>
#import <Masonry/Masonry.h>
@interface ZZItemInfoController ()
@property (weak, nonatomic) IBOutlet UISwitch *switch1;

@end

@implementation ZZItemInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    //frame
    ZZInfoItem *item = [[ZZInfoItem alloc] initWithFrame:CGRectMake(50, NAV_STATUS_BAR_H() + 100,SCREEN_W()-100, 300)];
    item.subItems = @[
                    @{
                        ZZTitleKey:@"你好啊",
                        ZZBgcKey:@"#1FDCA1",
                        ZZCornerRadius:@"4.5",
                        ZZPadding:@"7.5/2.5/7.5/2.5",
                    },
                    @{
                        ZZTitleKey:@"你好啊！",
                        ZZBgcKey:@"#1FDCA1",
                        ZZCornerRadius:@"4.5",
                        ZZPadding:@"7.5/2.5/7.5/2.5",
                    },
                    @{
                        ZZTitleKey:@"李银河2！",
                        ZZBgcKey:@"#1FDCA1",
                        ZZCornerRadius:@"4.5",
                        ZZPadding:@"7.5/2.5/7.5/2.5",
                    },
                    @{
                        ZZTitleKey:@"李银河3！",
                        ZZBgcKey:@"#1FDCA1",
                        ZZCornerRadius:@"4.5",
                        ZZPadding:@"7.5/2.5/7.5/2.5",
                    },
                    @{
                        ZZTitleKey:@"李银河4！",
                        ZZBgcKey:@"#1FDCA1",
                        ZZCornerRadius:@"4.5",
                        ZZPadding:@"7.5/2.5/7.5/2.5",
                    },
     ];
    item.title.text = @"穿越银河";
    item.subtitle.text = @"2021";
    [self.view addSubview:item];
    [item layoutIfNeeded];
    _switch1.zz_origin = CGPointMake(item.zz_x, item.zz_bottom);
    
//    masonry混用
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = zz_RGBHex(0xff00ff);
    [self.view insertSubview:bgView atIndex:0];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(item).insets(UIEdgeInsetsMake(-10, -10, -10, -10));
    }];
}


@end
