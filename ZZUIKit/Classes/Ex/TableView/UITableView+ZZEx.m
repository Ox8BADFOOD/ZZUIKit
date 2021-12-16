//
//  UITableView+ZZEx.m
//  ZZUIKit
//
//  Created by Max on 2021/12/13.
//

#import "UITableView+ZZEx.h"

@implementation UITableView (ZZEx)

-(UITableView *)zz_style{
    if (@available(iOS 15.0, *)) {
        self.sectionHeaderTopPadding = 0;
    } else {
        
    }
    self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    return self;
}

@end
