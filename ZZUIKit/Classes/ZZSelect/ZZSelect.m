//
//  ZZSelect.m
//  ZZUIKit
//
//  Created by Max on 2021/3/9.
//

#import "ZZSelect.h"

@implementation ZZSelect

- (void)onInit{
    
}


/// ZZOption点击会调用这个方法
-(void)onClick{
    //遍历子视图取出选中的option
    _selectArr = [NSMutableArray array];
    for (UIView *view in self.subviews) {
        if ([view respondsToSelector:@selector(selected)]) {
            if ([view isKindOfClass:NSClassFromString(@"ZZOption")] || [view isKindOfClass:NSClassFromString(@"ZZCheckBox")]) {
                if (![[view valueForKey:@"selected"] boolValue]) {
                    continue;
                }
                NSString *str = [[view valueForKey:@"title"] valueForKey:@"text"];
                [_selectArr addObject:str];
            }
        }
    }
    NSLog(@"_selectArr:");
    for (NSString *str in _selectArr) {
        NSLog(@"%@",str);
    }
    if (_selectBlock) {
         
        _selectBlock(self.selectArr);
    }
}

@end
