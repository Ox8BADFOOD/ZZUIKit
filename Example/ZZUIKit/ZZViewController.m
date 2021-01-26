//
//  ZZViewController.m
//  ZZUIKit
//
//  Created by bymiracles@163.com on 01/04/2021.
//  Copyright (c) 2021 bymiracles@163.com. All rights reserved.
//

#import "ZZViewController.h"
#import <ZZUIKit/ZZUIKitEx.h>
#import <ZZUIKit/ZZDialog.h>
#import <ZZUIKit/ZZDialogViewController.h>
#import <ZZUIKit/ZZTextWidget.h>
CGFloat const handleBarH = 200;
@interface ZZViewController ()<ZZDialogDelegate,ZZDialogHandleDelegate>
@property(nonatomic,strong) ZZDialog *dialog;
@property(nonatomic,strong) ZZDialogViewController *dialogVC;
@property (strong, nonatomic) IBOutlet ZZTextWidget *textWidget;
@property(nonatomic,strong) NSArray *titles;
@end

@implementation ZZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
	// Do any additional setup after loading the view, typically from a nib.
    self.dialog.cancelBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    self.dialogVC.dialog.cancelBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    self.dialogVC.blurStyle = UIBlurEffectStyleLight;
    self.textWidget.maxLength = 10;
    self.textWidget.placeholder = @"请输入内容";
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            {
                UILabel *lab = [UILabel new];
                lab.text = @"直接添加到父视图";
                return lab;
            }
            break;
            
        default:
            {
                UILabel *lab = [UILabel new];
                lab.text = @"present";
                return lab;
            }
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        self.dialog.cancelPosition = indexPath.row;
        [self configDialog:self.dialog withIndex:indexPath.row];
        [self.view addSubview:self.dialog];
    }else if (indexPath.section == 1){
        self.dialogVC.dialog.cancelPosition = indexPath.row;
        [self configDialog:self.dialogVC.dialog withIndex:indexPath.row];
        [self presentViewController:self.dialogVC animated:false completion:nil];
    }
   
}
- (IBAction)deleteBtnShow:(UISwitch *)sender {
    _dialog.cancelBtn = sender.on ? [UIButton buttonWithType:UIButtonTypeContactAdd] : nil;
    _dialogVC.dialog.cancelBtn = sender.on ? [UIButton buttonWithType:UIButtonTypeContactAdd] : nil;
}

- (IBAction)blurOrMask:(UISwitch *)sender {
    if (sender.on) {
        _dialogVC.blurStyle = UIBlurEffectStyleLight;
    }else{
        _dialogVC.maskColor = [UIColor colorWithWhite:0 alpha:0.8];
    }
}


-(void)configDialog:(ZZDialog *)dialog withIndex:(NSInteger)index{
    switch (index) {
        case 1:
            dialog.cancelMargin = ZZDialogCancelMarginMake(10, 10);
            break;
        default:
            dialog.cancelMargin = ZZDialogCancelMarginMake(30, 10);
            break;
    }
}

-(CGRect)preferredFrameForDialog:(ZZDialog *)dialog{
    return CGRectMake(SCREEN_W()/6, SCREEN_H()/4, SCREEN_W()*4/6, SCREEN_H()/2);
}

#pragma mark -- ZZDialogContenDelegate
-(CGRect)preferredFrameForContentInDialog:(ZZDialog *)dialog{
    return CGRectMake(0, 0, dialog.zz_width, dialog.zz_height - handleBarH);
}

-(__kindof UIView *)viewForContentInDialog:(ZZDialog *)dialog{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor redColor];
    view.layer.borderColor = [UIColor purpleColor].CGColor;
    view.layer.borderWidth = 3;
    return view;
}
#pragma mark -- ZZDialogHandleDelegate
-(CGRect)preferredFrameForHandleInDialog:(ZZDialog *)dialog{
    return CGRectMake(0, dialog.zz_height - handleBarH, dialog.zz_width, handleBarH);
}

-(NSArray<NSDictionary *> *)itemsForHandleInDialog:(ZZDialog *)dialog{
    return @[
        @{ZZTitleKey:@"que定",
          ZZFontKey:[UIFont systemFontOfSize:20],
          ZZTitleColorKey:[UIColor purpleColor],
          ZZActionKey:^(){
              [dialog dismiss];
          }
        },
        @{ZZTitleKey:@"取消",
          ZZFontKey:[UIFont systemFontOfSize:20],
          ZZTitleColorKey:[UIColor grayColor],
          ZZActionKey:^(){
              [dialog dismiss];
          }
        },
        @{ZZTitleKey:@"再想想",
                 ZZFontKey:[UIFont systemFontOfSize:20],
                 ZZTitleColorKey:[UIColor grayColor],
                 ZZActionKey:^(){
                     [dialog dismiss];
                 }
               },
    ];
}

-(ZZDialog *)dialog{
    if(!_dialog){
         _dialog = [[ZZDialog alloc] initWithFrame:CGRectMake(SCREEN_W()/4, SCREEN_H()/4, SCREEN_W()/2, SCREEN_H()/2)];
            _dialog.contentDelegate = self;
            _dialog.handleDelegate = self;
            _dialog.backgroundColor = [UIColor greenColor];
    }
    return _dialog;
}
-(ZZDialogViewController *)dialogVC{
    if(!_dialogVC){
        _dialogVC = [ZZDialogViewController new];
        _dialogVC.maskColor = [UIColor colorWithWhite:0 alpha:0.7];
        _dialogVC.dialogDelegate = self;
        _dialogVC.handleDelegate = self;
        _dialogVC.dialog.backgroundColor = [UIColor greenColor];
    }
    return _dialogVC;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
