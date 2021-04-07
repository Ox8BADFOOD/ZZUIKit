//
//  ZZRadio.m
//  ZZUIKit
//
//  Created by Max on 2021/3/3.
//

#import "ZZRadio.h"
#import <ZZUIKit/ZZCheckBox.h>

@interface ZZRadio()
@property(nonatomic,strong) NSMutableArray *itemArr;
@property(nonatomic,copy) NSArray <NSString *> * labels;
@end

@implementation ZZRadio

- (void)onInit{
    _itemArr = [NSMutableArray array];
    
}

FLEXSET(label){
    self.labels = [sValue componentsSeparatedByString:@"/"];
    
}

- (void)willMoveToWindow:(UIWindow *)newWindow{
    for (NSString *str in self.labels) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveRadio:) name:ZZRadioNotification(str) object:nil];
    }
}

-(void)onClick{
    for (NSString *str in self.labels) {
        [[NSNotificationCenter defaultCenter] postNotificationName:ZZRadioNotification(str) object:nil userInfo:@{
            @"address":[NSString stringWithFormat:@"%p",self]
        }];
    }
    
    
    for (UIView *view in self.subviews) {
        if ([view respondsToSelector:@selector(selected)]) {
            if ([view isKindOfClass:NSClassFromString(@"ZZOption")] || [view isKindOfClass:NSClassFromString(@"ZZCheckBox")]) {
                if (![[view valueForKey:@"selected"] boolValue]) {
                    continue;
                }
                self.selectStr = [[view valueForKey:@"titleLab"] valueForKey:@"text"];
                if (self.selectedBlock) {
                    self.selectedBlock(self.selectStr);
                    //退出循环
                    return;
                }
            }
        }
    }
}

-(void)receiveRadio:(NSNotification *)noti{
    //是自己发出的通知就return
    if ([noti.userInfo[@"address"] isEqualToString:[NSString stringWithFormat:@"%p",self]]) {
        return;
    }
    
    if (_itemArr.count == 0) {
        for (UIView *view in self.subviews) {
           if ([view respondsToSelector:@selector(setSelected:)]){
               [_itemArr addObject:view];
           }
        }
    }
    
    for (UIView *box in _itemArr) {
        if ([box respondsToSelector:@selector(setSelected:)]) {
            [box setValue:@(false) forKey:@"selected"];
        }
        self.selectStr = nil;
    }
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(NSBundle *)bundleForRes{
    return nil;
}

@end
