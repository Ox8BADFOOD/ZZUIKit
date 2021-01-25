//
//  ZZRuleWidget.m
//  ZZUIKit_Example
//
//  Created by Max on 2021/1/22.
//  Copyright © 2021 bymiracles@163.com. All rights reserved.
//

#import "ZZRuleWidget.h"
#import "CRRulerControl.h"
@implementation ZZRuleWidget

-(void)onInit{
//    self.flexibleHeight = YES;
    CRRulerControl *rule = [[CRRulerControl alloc] init];
    [self.ruleContainer addSubview:rule];
    [rule enableFlexLayout:YES];
            [rule setLayoutAttrStrings:@[
                                         @"flex",@"1",
                                         @"height",@"35",
    //                                     @"marginTop",@"5",
    //                                     @"marginBottom",@"5",
    //                                     @"alignItems",@"center",
    //                                     @"justifyContent",@"center",
                                         ]];
            [rule setViewAttr:@"bgColor" Value:@"#ff0000"];
}

@end
