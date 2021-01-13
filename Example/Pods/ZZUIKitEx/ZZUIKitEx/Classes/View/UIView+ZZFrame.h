//
//  UIView+ZZFrame.h
// 
//
//  Created by Charles on 16/9/1.
//  Copyright © 2016年 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZZFrame)

/**
 *  起点x坐标
 */
@property (nonatomic, assign) CGFloat zz_x;
/**
 *  起点y坐标
 */
@property (nonatomic, assign) CGFloat zz_y;
/**
 *  中心点x坐标
 */
@property (nonatomic, assign) CGFloat zz_centerX;
/**
 *  中心点y坐标
 */
@property (nonatomic, assign) CGFloat zz_centerY;
/**
 *  宽度
 */
@property (nonatomic, assign) CGFloat zz_width;
/**
 *  高度
 */
@property (nonatomic, assign) CGFloat zz_height;
/**
 *  顶部
 */
@property (nonatomic, assign) CGFloat zz_top;
/**
 *  底部
 */
@property (nonatomic, assign) CGFloat zz_bottom;
/**
 *  左边
 */
@property (nonatomic, assign) CGFloat zz_left;
/**
 *  右边
 */
@property (nonatomic, assign) CGFloat zz_right;
/**
 *  size
 */
@property (nonatomic, assign) CGSize zz_size;
/**
 *  起点坐标
 */
@property (nonatomic, assign) CGPoint zz_origin;


@end
