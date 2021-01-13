//
//  NSString+ZZEx.h
//  Kiwi
//
//  Created by Max on 2020/12/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ZZEx)

FOUNDATION_EXPORT NSString * ZZString(NSString *format, ...);


/// 空字符串 包含 @“”，@“  ”，@“ \n(回车)”
- (BOOL)ZZEmpty;

/// 提取字符串的片断，返回index开始到最后
/// @param index 开始的下标
-(NSString *)ZZSlice:(NSInteger)index;

/// 字符串切割，返回从star到end范围内的字符串
/// @param star 开始下标
/// @param end 结束下标
-(NSString *)ZZSlice:(NSInteger)star end:(NSInteger)end;

/// 字符串切割，返回从star开始length范围内的字符串
/// @param star 开始下标
/// @param length 子字符串的长度
-(NSString *)ZZSlice:(NSInteger)star length:(NSInteger)length;


/// 切割字符串
/// @param separator 从该参数指定的地方分割
-(NSArray *)ZZSplit:(NSString *)separator;



/// 遍历字符串返回子字符串range的数组集合
/// @param subStr 匹配的子字符串
- (NSArray*)ZZRangeOfSubString:(NSString*)subStr;

/// 用b替换字符串中所有的a
/// @param aStr 匹配的字符串
/// @param bStr 替换的字符串
-(NSString *)ZZReplace:(NSString *)aStr with:(NSString *)bStr;
@end

NS_ASSUME_NONNULL_END
