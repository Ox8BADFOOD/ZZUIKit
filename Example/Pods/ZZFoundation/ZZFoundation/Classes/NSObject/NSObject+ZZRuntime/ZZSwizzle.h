//
//  NSObject+ZZSwizzle.h
//  RuiBeiKang
//
//  Created by Apple on 8/7/19.
//  Copyright © 2019年 JW. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

BOOL ZZ_simple_Swizzle(Class aClass, SEL originalSel,SEL swizzleSel);
BOOL ZZ_best_Swizzle(Class aClass, SEL originalSel,SEL swizzleSel);

NS_ASSUME_NONNULL_END
