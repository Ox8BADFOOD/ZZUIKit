//
//  UIAlertController+ZZEx.m
//  lock
//
//  Created by bym on 2018/9/11.
//  Copyright © 2018年 BYM. All rights reserved.
//

#import "UIAlertController+ZZEx.h"

@implementation UIAlertController (ZZEx)
+(UIAlertController *)zz_alertControllerWithTitle:(NSString *)title message:(NSString *)message confirmBlock:(void (^)(void))confirmBlock cancelBlock:(void (^)(void))cancelBlock{
	UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
	
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
		if (confirmBlock) {
            confirmBlock();
        }
	}];
	[cancelAction setValue:[UIColor lightGrayColor] forKey:@"_titleTextColor"];
	[alertController addAction:cancelAction];
    
    UIAlertAction *confirmAct = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        if (cancelBlock) {
            cancelBlock();
        }
    }];

    [alertController addAction:confirmAct];
    
	return alertController;
}

+(UIAlertController *)zz_alertControllerWithTitle:(NSString *)title message:(NSString *)message confirmBlock:(void (^)(void))confirmBlock{
	UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *confirmAct = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
		if (confirmBlock) {
			confirmBlock();
		}
	}];

	[alertController addAction:confirmAct];
	return alertController;
}
@end
