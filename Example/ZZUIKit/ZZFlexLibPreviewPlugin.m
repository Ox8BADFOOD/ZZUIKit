//
//  ZZFlexLibPreviewPluginVC.m
//  ZZUIKit_Example
//
//  Created by Max on 2021/1/26.
//  Copyright © 2021 bymiracles@163.com. All rights reserved.
//

#import "ZZFlexLibPreviewPlugin.h"
#import <ZZUIKitEx.h>
#import <ZZUIKit/ZZViewHierarchy.h>
@interface ZZFlexLibPreviewPlugin ()

@end

@implementation ZZFlexLibPreviewPlugin

- (void)pluginDidLoad{
    [ZZFlexLibPreviewPlugin presentInVC:[ZZViewHierarchy ZZCurrentViewController]];
    [[DoraemonManager shareInstance] hiddenHomeWindow];
}


@end
