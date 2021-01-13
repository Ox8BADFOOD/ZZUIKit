//
//  UIView+Frame.m
// 
//
//  Created by Charles on 16/9/1.
//  Copyright © 2016年 Charles. All rights reserved.
//

#import "UIView+ZZFrame.h"

@implementation UIView (ZZFrame)

-(void)setZz_x:(CGFloat)zz_x{
	CGRect frame = self.frame;
	frame.origin.x = zz_x;
	self.frame = frame;
}

-(void)setZz_y:(CGFloat)zz_y{
	CGRect frame = self.frame;
	frame.origin.y = zz_y;
	self.frame = frame;
}

-(CGFloat)zz_x{
	return self.frame.origin.x;
}

- (CGFloat)zz_y {
    return self.frame.origin.y;
}

- (void)setZz_centerX:(CGFloat)zz_centerX {
    CGPoint center = self.center;
    center.x = zz_centerX;
    self.center = center;
}

- (CGFloat)zz_centerX {
    return self.center.x;
}

- (void)setZz_centerY:(CGFloat)zz_centerY{
    CGPoint center = self.center;
    
    center.y = zz_centerY;
    
    self.center = center;
}

- (CGFloat)zz_centerY {
    return self.center.y;
}

- (void)setZz_width:(CGFloat)zz_width {
    CGRect frame = self.frame;
    frame.size.width = zz_width;
    self.frame = frame;
}

- (void)setZz_height:(CGFloat)zz_height {
    CGRect frame = self.frame;
    frame.size.height = zz_height;
    self.frame = frame;
}

- (CGFloat)zz_height {
    return self.frame.size.height;
}

- (CGFloat)zz_width {
    return self.frame.size.width;
}

- (void)setZz_size:(CGSize)zz_size {
    CGRect frame = self.frame;
    frame.size = zz_size;
    self.frame = frame;
}

- (CGSize)zz_size {
    return self.frame.size;
}

- (void)setZz_origin:(CGPoint)zz_origin {
    CGRect frame = self.frame;
    frame.origin = zz_origin;
    self.frame = frame;
}

- (CGPoint)zz_origin {
    return self.frame.origin;
}
- (CGFloat)zz_top
{
    return self.frame.origin.y;
}

- (void)setZz_top:(CGFloat)zz_top
{
    CGRect frame = self.frame;
    frame.origin.y = zz_top;
    self.frame = frame;
}

- (CGFloat)zz_left
{
    return self.frame.origin.x;
}

- (void)setZz_left:(CGFloat)zz_left
{
    CGRect frame = self.frame;
    frame.origin.x = zz_left;
    self.frame = frame;
}


- (CGFloat)zz_bottom
{
    return self.frame.size.height + self.frame.origin.y;
}

- (void)setZz_bottom:(CGFloat)zz_bottom
{
    CGRect frame = self.frame;
    frame.origin.y = zz_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)zz_right
{
    return self.frame.size.width + self.frame.origin.x;
}

- (void)setZz_right:(CGFloat)zz_right
{
    CGRect frame = self.frame;
    frame.origin.x = zz_right - frame.size.width;
    self.frame = frame;
}



@end
