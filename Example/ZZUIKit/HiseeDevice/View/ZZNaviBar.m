//
//  ZZNaviBar.m
//  ZZUIKit_Example
//
//  Created by Max on 2021/1/21.
//  Copyright © 2021 bymiracles@163.com. All rights reserved.
//

#import "ZZNaviBar.h"

@implementation ZZNaviBar


-(void)setItems:(NSArray *)items{
    NSArray *arr = [@[_view1,_view2,_view3,_view4] subarrayWithRange:NSMakeRange(items.count - 1, items.count - 4)];
    for (UIView *view in arr) {
        view.hidden = true;
    }
    for (NSDictionary *dic in items) {
        
    }
}

-(void)onInit{
    self.flexibleHeight = YES;
//    self.flexibleWidth = YES;
//    _view4.hidden = true;
}

-(void)onClick:(id)sender{
    NSLog(@"%@",sender);
    if (!self.barNavsBlock) {
           return;
       }
    if ([sender isKindOfClass:[UITapGestureRecognizer class]]) {
        UIView *view = [(UITapGestureRecognizer *)sender view];
        if (view == _view1) {
            NSLog(@"0");
            self.barNavsBlock(0);
        }
        if (view == _view2) {
            NSLog(@"1");
            self.barNavsBlock(1);
        }
        if (view == _view3) {
            NSLog(@"2");
            self.barNavsBlock(3);
        }
        if (view == _view4) {
            NSLog(@"3");
            self.barNavsBlock(4);
        }
    }
    
}
@end
