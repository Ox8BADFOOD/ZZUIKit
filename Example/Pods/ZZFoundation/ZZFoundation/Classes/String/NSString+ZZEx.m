//
//  NSString+ZZEx.m
//  Kiwi
//
//  Created by Max on 2020/12/28.
//

#import "NSString+ZZEx.h"

@implementation NSString (Ex)


/// 格式化字符串创建
/// @param format 格式化
NSString * ZZString(NSString *format, ...)
{
    va_list ap;
    va_start (ap, format);

    NSString *body = [[NSString alloc] initWithFormat:format arguments:ap];

    va_end (ap);

    return body;
}

/**
 *  判断字符串是否为空
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ZZEmpty{
    if (!self) {
        return true;
    } else {
        //A character set containing only the whitespace characters space (U+0020) and tab (U+0009) and the newline and nextline characters (U+000A–U+000D, U+0085).
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
         
        //Returns a new string made by removing from both ends of the receiver characters contained in a given character set.
        NSString *trimedString = [self stringByTrimmingCharactersInSet:set];
         
        if ([trimedString length] == 0) {
            return true;
        } else {
            return false;
        }
    }
}

-(NSString *)ZZSlice:(NSInteger)star{
    return [self substringFromIndex:star];
};

-(NSString *)ZZSlice:(NSInteger)star end:(NSInteger)end{
    NSRange range = NSMakeRange(star, end);
    return [self substringWithRange:range];
};

-(NSString *)ZZSlice:(NSInteger)star length:(NSInteger)length{
    return [self ZZSlice:star end:star + length];
}

-(NSArray *)ZZSplit:(NSString *)separator{
    return [self componentsSeparatedByString:separator];
};

- (NSArray*)ZZRangeOfSubString:(NSString*)subStr{
    NSMutableArray *rangeArray = [NSMutableArray array];
    NSString*string1 = [self stringByAppendingString:subStr];
    NSString *temp;
    for(int i =0; i < self.length; i ++) {
        temp = [string1 substringWithRange:NSMakeRange(i, subStr.length)];
        if ([temp isEqualToString:subStr]) {
            NSRange range = {i,subStr.length};
            [rangeArray addObject: [NSValue valueWithRange:range]];
        }
    }
    return rangeArray;
}

-(NSString *)ZZReplace:(NSString *)aStr with:(NSString *)bStr{
    NSMutableString *muStr = [self mutableCopy];
    NSArray *ranges = [muStr ZZRangeOfSubString:aStr];
    for (NSValue *value  in ranges) {
        NSRange range = [value rangeValue];
        muStr = [[muStr stringByReplacingCharactersInRange:range withString:bStr] mutableCopy];
    }
    return muStr;
}
@end
