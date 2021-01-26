//
//  ZZClass.m
//  Kiwi
//
//  Created by Max on 2021/1/11.
//

#import "ZZClass.h"

NSString * zz_getObjClass(NSObject *obj){
    return [NSStringFromClass([obj class]) componentsSeparatedByString:@"."].lastObject;
};
