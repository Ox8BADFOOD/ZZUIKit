//
//  UILabel+ZZStroke.m
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/11.
//

#import "UILabel+ZZStroke.h"
#import <ZZFoundation/ZZSwizzle.h>
#import "objc/runtime.h"

@implementation UILabel (ZZStroke)
+ (void)load{
    [super load];
    ZZ_best_Swizzle(self, @selector(drawRect:), @selector(zz_drawRect:));
}

#pragma mark -- strokeWidth
static void *ZZStrokeWidth = &ZZStrokeWidth;
static void *ZZShowStrokeKey = &ZZShowStrokeKey;
-(CGFloat)zz_strokeWidth{
    return [objc_getAssociatedObject(self, &ZZStrokeWidth) floatValue];
}

-(void)setZz_strokeWidth:(CGFloat)zz_strokeWidth{
    objc_setAssociatedObject(self, &ZZStrokeWidth, @(zz_strokeWidth), OBJC_ASSOCIATION_ASSIGN);
    objc_setAssociatedObject(self, &ZZShowStrokeKey, @(YES), OBJC_ASSOCIATION_ASSIGN);
}

#pragma mark -- strokeColor
static void *ZZStrokeColor = &ZZStrokeColor;
-(void)setZz_strokeColor:(UIColor *)zz_strokeColor{
    objc_setAssociatedObject(self, &ZZStrokeColor, zz_strokeColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UIColor *)zz_strokeColor{
    return objc_getAssociatedObject(self, &ZZStrokeColor);
}

-(void)zz_drawRect:(CGRect)rect{
    
    if (objc_getAssociatedObject(self, &ZZShowStrokeKey)) {
        UIColor *textColor = self.textColor;
        CGContextRef c = UIGraphicsGetCurrentContext ();
        CGContextSetLineWidth (c, self.zz_strokeWidth);
        CGContextSetLineJoin (c, kCGLineJoinRound);
        if (self.zz_strokeColor) {
            self.textColor = self.zz_strokeColor;
            CGContextSetTextDrawingMode (c, kCGTextStroke);
            [self zz_drawRect:rect];
            
            self.textColor = textColor;
            CGContextSetTextDrawingMode(c, kCGTextFill);
        }else{
            //描边
             self.textColor = self.textColor;
             CGContextSetTextDrawingMode (c, kCGTextFillStroke);
        }
    }
    [self zz_drawRect:rect];
}
@end
