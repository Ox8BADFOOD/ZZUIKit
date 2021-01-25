//
//  ZZPointBar.m
//  ZZUIKit_Example
//
//  Created by Max on 2021/1/21.
//  Copyright © 2021 bymiracles@163.com. All rights reserved.
//

#import "ZZPointBar.h"
#import <ZZUIKit/ZZUIKitConst.h>
@interface ZZPointBar()

@end
@implementation ZZPointBar

-(void)onInit{
    self.flexibleHeight = YES;
//    self.flexibleWidth = YES;
}

-(void)setItems:(NSArray<NSDictionary *> *)items{
    for (NSDictionary *item in items){
        UIView* cell = [[UIView alloc]init];
         [_sectionContainer addSubview:cell];
        [cell enableFlexLayout:YES];
        [cell setLayoutAttrStrings:@[
                                     @"flex",@"1",
                                     @"height",@"5",
//                                     @"marginTop",@"5",
//                                     @"marginBottom",@"5",
//                                     @"alignItems",@"center",
//                                     @"justifyContent",@"center",
                                     ]];
        [cell setViewAttr:@"bgColor" Value:item[ZZBgcKey]];
    }
    [_sectionContainer markDirty];
}

@end
