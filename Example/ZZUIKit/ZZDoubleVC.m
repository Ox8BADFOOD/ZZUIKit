//
//  ZZCustomDoubleViewController.m
//  ZZUIKit_Example
//
//  Created by Max on 2021/1/14.
//  Copyright © 2021 bymiracles@163.com. All rights reserved.
//

#import "ZZDoubleVC.h"
#import <ZZUIKit/ZZUIKitEx.h>
@interface ZZDoubleVC ()<ZZDoubleViewControllerContainer,UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZZDoubleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
}

-(CGRect)mainRect{
    return CGRectMake(0, 0, SCREEN_W()/4, SCREEN_H());;
}

-(CGRect)subRect{
    return CGRectMake(SCREEN_W()/4, 0, SCREEN_W()*3/4, SCREEN_H());
}

-(UIViewController *)mainController{
    UITableViewController *tabviewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    tabviewController.tableView.delegate = self;
    tabviewController.tableView.dataSource = self;
    return tabviewController;
}


-(UIViewController *)subController{
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor redColor];
    return vc;
}

#pragma mark -- tableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = @"123123";
    return cell;
}


@end
