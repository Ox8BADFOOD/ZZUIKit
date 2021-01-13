//
//  NSDate+ZZTimeStamp.m
//  Kiwi
//
//  Created by Max on 2020/12/30.
//

#import "NSDate+ZZTimeStamp.h"

@implementation NSDate (ZZTimeStamp)

/// 获取当前时间戳
+(NSTimeInterval)ZZTimeStamp{
    return [[NSDate date] timeIntervalSince1970];
};

/// Date转时间戳
-(NSTimeInterval)ZZTimeStamp{
    return [self timeIntervalSince1970];
};


/// 时间戳转当前时间
/// @param stamp 时间戳
-(NSDate *)ZZDateFromStamp:(NSTimeInterval)stamp{
    return [NSDate dateWithTimeIntervalSince1970:stamp];
};
@end
