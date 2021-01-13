//
//  NSString+ZZRect.h
//  ruibeikang
//
//  Created by Apple on 23/7/19.
//  Copyright © 2019年 Qzz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ZZRect)

/// 返回block，block的参数是width和font，block的返回值是计算出来的高度
-(CGFloat (^)(CGFloat width,UIFont *font))ZZRectHeigh;

/// 返回block，block的参数是height和font，block的返回值是计算出来的宽度
-(CGFloat (^)(CGFloat heigh,UIFont *font))ZZRectWidth;
@end

NS_ASSUME_NONNULL_END
