//
//  NSArray+ZZEx.h
//  RuiBeiKang
//
//  Created by Apple on 3/7/19.
//  Copyright © 2019年 JW. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (ZZEx)

-(BOOL)ZZEmpty;

//连接两个或更多的数组，并返回结果。
-(NSArray *)ZZConact:(NSArray *)arr;

//把数组的所有元素放入一个字符串。元素通过指定的分隔符进行分隔。
-(NSString *)ZZJoin:(NSString *)separate;

//倒序重拍列
-(NSArray *)ZZReverse;

-(NSArray *)ZZMap:(id(^)(id))x;


-(NSArray*)ZZFilter:(BOOL(^)(id))Filter;
@end

NS_ASSUME_NONNULL_END
