//
//  NSDate+ZZTimeStamp.h
//  Kiwi
//
//  Created by Max on 2020/12/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (ZZTimeStamp)

/// 获取当前时间戳
+(NSTimeInterval)ZZTimeStamp;

/// Date转时间戳
-(NSTimeInterval)ZZTimeStamp;


/// 时间戳转当前时间
/// @param stamp 时间戳
-(NSDate *)ZZDateFromStamp:(NSTimeInterval)stamp;
@end

NS_ASSUME_NONNULL_END
