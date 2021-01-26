//
//  UIButton+ZZAnima.m
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/9.
//

#import "UIButton+ZZAnima.h"
#import "objc/runtime.h"

@implementation UIButton (ZZAnima)
static void *zz_imgRotatedKey = &zz_imgRotatedKey;

-(void)setZz_imgRotated:(BOOL)zz_imgRotated{
    objc_setAssociatedObject(self, &zz_imgRotatedKey, @(zz_imgRotated), OBJC_ASSOCIATION_ASSIGN);
}

-(BOOL)zz_imgRotated{
    return [objc_getAssociatedObject(self, &zz_imgRotatedKey) boolValue];
}

-(void)zz_imgAnmimaRotate{
    [self zz_imgAnmimaRotateDuration:0.5];
}

-(void)zz_imgAnmimaRotateDuration:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration animations:^{
           self.imageView.transform = CGAffineTransformMakeRotation(self.zz_imgRotated ? 2*M_PI : M_PI);
           
       } completion:^(BOOL finished) {
           self.zz_imgRotated = !self.zz_imgRotated;
       }];
}
@end
