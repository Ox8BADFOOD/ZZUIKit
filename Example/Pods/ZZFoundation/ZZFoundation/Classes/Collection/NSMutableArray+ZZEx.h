//
//  NSMutableArray+ZZEx.h
//  Kiwi
//
//  Created by Max on 2020/12/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (ZZEx)
//删除并返回数组的第一个元素
-(id)ZZShift;

//删除并返回数组的最后一个元素
-(id)ZZPop;

//向数组的末尾添加一个或更多元素，并返回新的长度。
-(NSInteger)ZZPush:(id) obj;
@end

NS_ASSUME_NONNULL_END
