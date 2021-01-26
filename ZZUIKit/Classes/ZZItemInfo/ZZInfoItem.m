//
//  ZZInfoItem.m
//  Aspects
//
//  Created by Max on 2021/1/26.
//

#import "ZZInfoItem.h"


@implementation ZZInfoItem

-(NSBundle *)bundleForRes{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSURL *bundleURL = [bundle URLForResource:@"ZZUIKit" withExtension:@"bundle"];
    NSBundle *resourceBundle = [NSBundle bundleWithURL: bundleURL];
    return resourceBundle;
}

-(void)onInit{
    self.flexibleHeight = YES;
//    self.flexibleWidth = YES;
//    _view4.hidden = true;
}

-(void)setSubItems:(NSArray<NSDictionary *> *)subItems{
    for (NSDictionary *item in subItems){
        UILabel *label = [[UILabel alloc] init];
         [_describeContainer addSubview:label];
        [label enableFlexLayout:YES];
        [label setLayoutAttrStrings:@[
                                     @"marginBottom",@"5",
                                     @"marginRight",@"5",
                                     @"padding",item[ZZPadding],
                                     ]];
        [label setViewAttr:@"borderRadius" Value:item[ZZCornerRadius]];
        if (item[ZZCornerRadius]) {
//            [cell setViewAttr:@"clipsToBounds" Value:@"true"];
            label.clipsToBounds = true;
        }
        [label setViewAttr:@"bgColor" Value:item[ZZBgcKey]];
        [label setViewAttr:@"text" Value:item[ZZTitleKey]];
        [label setViewAttr:@"color" Value:item[ZZTitleColorKey]];
        [label setViewAttr:@"color" Value:item[ZZTitleColorKey]];
        label.textAlignment = NSTextAlignmentCenter;
    }
    [_describeContainer markDirty];
}
@end
