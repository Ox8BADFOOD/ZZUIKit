//
//  NSDateFormatter+ZZEx.m
//  Kiwi
//
//  Created by Max on 2020/12/29.
//

#import "NSDateFormatter+ZZEx.h"

@implementation NSDateFormatter (ZZEx)
+(instancetype)format1{
    NSDateFormatter *format = [NSDateFormatter new];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return format;
};

+(instancetype)format2{
    NSDateFormatter *format = [NSDateFormatter new];
    [format setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    return format;
};

+(instancetype)format3{
    NSDateFormatter *format = [NSDateFormatter new];
    [format setDateFormat:@"yyyy.MM.dd HH:mm:ss"];
    return format;
};

+(instancetype)format2_1{
    NSDateFormatter *format = [NSDateFormatter new];
    [format setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    return format;
};

+(instancetype)format4_0{
    NSDateFormatter *format = [NSDateFormatter new];
    [format setDateFormat:@"yyyy-MM-dd"];
    return format;
};
+(instancetype)format4_1{
    NSDateFormatter *format = [NSDateFormatter new];
    [format setDateFormat:@"yyyy年MM月dd日"];
    return format;
};
+(instancetype)format5{
    NSDateFormatter *format = [NSDateFormatter new];
    [format setDateFormat:@"yyyy/MM/dd"];
    return format;
};
+(instancetype)format6{
    NSDateFormatter *format = [NSDateFormatter new];
    [format setDateFormat:@"yyyy.MM.dd"];
    return format;
};

+(instancetype)format7{
    NSDateFormatter *format = [NSDateFormatter new];
    [format setDateFormat:@"HH:mm:ss"];
    return format;
};

+(instancetype)format8{
    NSDateFormatter *format = [NSDateFormatter new];
    [format setDateFormat:@"HH:mm"];
    return format;
};
@end
