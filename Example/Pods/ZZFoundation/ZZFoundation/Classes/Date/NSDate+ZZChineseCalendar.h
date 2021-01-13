//
//  NSDate+ZZChineseCalendar.h
//  Kiwi
//
//  Created by Max on 2020/12/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (ZZChineseCalendar)
+(NSString*)chineseCalendarWithDate:(NSDate *)date;
@end

NS_ASSUME_NONNULL_END
