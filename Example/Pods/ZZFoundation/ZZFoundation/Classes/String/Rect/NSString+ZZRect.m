//
//  NSString+ZZSize.m
//  ruibeikang
//
//  Created by Apple on 23/7/19.
//  Copyright © 2019年 Qzz. All rights reserved.
//

#import "NSString+ZZRect.h"

@implementation NSString (ZZRect)

-(CGFloat (^)(CGFloat width,UIFont *font))ZZRectHeigh{
    return ^(CGFloat width,UIFont *font){
        NSDictionary *attribute = @{NSFontAttributeName: font};
        CGSize  size = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)  options:NSStringDrawingUsesLineFragmentOrigin  |NSStringDrawingUsesFontLeading |NSStringDrawingTruncatesLastVisibleLine attributes:attribute context:nil].size;
        return size.height;
    };
}

-(CGFloat (^)(CGFloat heigh,UIFont *font))ZZRectWidth{
    return ^(CGFloat heigh,UIFont *font){
        NSDictionary *attribute = @{NSFontAttributeName: font};
        CGSize  size = [self boundingRectWithSize:CGSizeMake(heigh,MAXFLOAT)  options:NSStringDrawingUsesLineFragmentOrigin  |NSStringDrawingUsesFontLeading |NSStringDrawingTruncatesLastVisibleLine attributes:attribute context:nil].size;
        return size.width;
    };
}

@end
