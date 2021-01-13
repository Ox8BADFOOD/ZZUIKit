//
//  NSMutableArray+ZZEx.m
//  Kiwi
//
//  Created by Max on 2020/12/28.
//

#import "NSMutableArray+ZZEx.h"

@implementation NSMutableArray (ZZEx)

//删除并返回数组的第一个元素
-(id)ZZShift{
    if (self.count == 0) {
        return nil;
    }
    id obj = self.firstObject;
    [self removeObjectAtIndex:0];
    return obj;
};

-(id)ZZPop{
    if (self.count == 0) {
        return nil;
    }
    id obj = self.lastObject;
    [self removeLastObject];
    return obj;
};

//向数组的末尾添加一个或更多元素，并返回新的长度。
-(NSInteger)ZZPush:(id) obj{
    [self addObject:obj];
    return self.count;
}
@end
