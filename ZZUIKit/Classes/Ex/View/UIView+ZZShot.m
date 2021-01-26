//
//  UIView+ZZShot.m
//  meimeika
//
//  Created by bym on 2019/11/7.
//  Copyright © 2019 sun. All rights reserved.
//

#import "UIView+ZZShot.h"



@implementation UIView (ZZShot)

- (UIImage*)zz_shot{
	UIGraphicsBeginImageContext(self.bounds.size);
	[self.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return image;
}

@end
