//
//  UIAlertController+ZZEx.h
//  lock
//
//  Created by bym on 2018/9/11.
//  Copyright © 2018年 BYM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (ZZEx)

/// 快速创建alertController
/// @param title 标题
/// @param message 消息
/// @param confirmBlock 确定行为
/// @param cancelBlock 取消行为
+(UIAlertController *)zz_alertControllerWithTitle:(NSString *)title message:(NSString *)message confirmBlock:(void (^)(void))confirmBlock cancelBlock:(void (^)(void))cancelBlock;

/// 快速创建alertController
/// @param title 标题
/// @param message 消息
/// @param confirmBlock 确定行为
+(UIAlertController *)zz_alertControllerWithTitle:(NSString *)title message:(NSString *)message confirmBlock:(void (^)(void))confirmBlock;
@end
