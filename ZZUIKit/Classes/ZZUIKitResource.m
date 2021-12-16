//
//  ZZUIKitResource.m
//  ZZUIKit
//
//  Created by Max on 2021/12/8.
//

#import <Foundation/Foundation.h>
#import "ZZUIKitResource.h"

NSBundle* zz_bundle_uikit(){
    NSBundle *bundle = [NSBundle bundleForClass:NSClassFromString(@"ZZViewHierarchy")];
    NSURL *bundleURL = [bundle URLForResource:@"ZZUIKit" withExtension:@"bundle"];
    NSBundle *resourceBundle = [NSBundle bundleWithURL: bundleURL];
    return resourceBundle;
}

UIImage* imageFactory(NSString * str){
    NSMutableString *muStr = [@"" mutableCopy];
    if ([muStr hasPrefix:@".png"]){
        muStr = [[muStr substringFromIndex:muStr.length - 5] mutableCopy];
    }
    NSString * path = [zz_bundle_uikit() pathForResource:muStr ofType:@"png"];
    return [UIImage imageWithContentsOfFile:path];
}
