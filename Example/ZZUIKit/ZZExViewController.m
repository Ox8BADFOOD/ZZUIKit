//
//  ZZViewController.m
//  ZZUIKitEx
//
//  Created by bymiracles@163.com on 01/07/2021.
//  Copyright (c) 2021 bymiracles@163.com. All rights reserved.
//

#import "ZZExViewController.h"
#import <ZZUIKit/ZZUIKitEx.h>
@interface ZZExViewController ()
@property(nonatomic,strong) UIImageView *imgV;
@property (weak, nonatomic) IBOutlet UIButton *testBtn;
@property(nonatomic,strong) UILabel *paddingLab;

@end

@implementation ZZExViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor = zz_RGBHex(0xff3333);
    [self configUI2];
}

-(void)configUI2{
    [self.testBtn zz_contentReverse:10];
//    self.testBtn.frame = CGRectMake(100, 100, 100, 100);
    self.testBtn.zz_click(^(UIControl *btn){
        [self.testBtn zz_imgAnmimaRotate];
    });
    
    _paddingLab = [UILabel new];
    _paddingLab.text = @"x";
    _paddingLab.zz_padding = UIEdgeInsetsMake(0, 10, 0, 0);
    _paddingLab.zz_x = 100;
    _paddingLab.zz_y = 100;
//    _paddingLab.zz_strokeWidth = 10;
    _paddingLab.zz_strokeColor = [UIColor redColor];
    [self.view addSubview:_paddingLab];
    [self.paddingLab sizeToFit];
    _paddingLab.backgroundColor = [UIColor lightGrayColor];
}

-(void)configUI1{
    _imgV = [[UIImageView alloc] init];
       [self.view addSubview:_imgV];
       _imgV.frame = CGRectMake(100, 200, 200, 400);
       _imgV.layer.borderColor = zz_RGBHex(0x000000).CGColor;
       _imgV.layer.borderWidth = 5;
       _imgV.image = zz_imgNamed(@"");
       self.view.zz_tapAction(^(UIView *view){
           self.imgV.image = [self.view zz_shot];
       });
       
       self.view.zz_longTapBlock = (^(UIView *view){
           NSLog(@"你好啊，小老弟");
       });
       ZZThrottleBtn *btn = [ZZThrottleBtn buttonWithType:UIButtonTypeSystem];
       [btn setTitle:@"click me" forState:UIControlStateNormal];
       btn.zz_throttleState = UIControlStateDisabled;
       btn.frame = CGRectMake(100, 60, 100, 40);
       btn.backgroundColor = [UIColor purpleColor];
       btn.zz_throttleDuration = 5;
       btn.zz_click(^(UIControl *btn){
           NSLog(@"%@",btn);
       });
       [btn setZz_backgroundColor:[UIColor redColor] forState:UIControlStateNormal];
       [btn setZz_backgroundColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
       [btn setZz_backgroundColor:[UIColor greenColor] forState:UIControlStateDisabled];
       [self.view addSubview:btn];
       NSLog(@"UIControlStateNormal bgc is %@",[btn zz_backgroundColorForState:UIControlStateNormal]);
       NSLog(@"UIControlStateHighlighted bgc is %@",[btn zz_backgroundColorForState:UIControlStateHighlighted]);
       NSLog(@"UIControlStateDisabled bgc is %@",[btn zz_backgroundColorForState:UIControlStateDisabled]);
       self.view.backgroundColor = [btn zz_backgroundColorForState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
