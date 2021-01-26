//
//  UILabel+ZZPadding.m
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/11.
//

#import "UILabel+ZZPadding.h"
#import <ZZFoundation/ZZSwizzle.h>
#import "objc/runtime.h"

@implementation UILabel (ZZPadding)
static void *ZZPaddingKey = &ZZPaddingKey;
static void *ZZShowPaddingKey = &ZZShowPaddingKey;

+ (void)load{
    [super load];
    ZZ_best_Swizzle(self, @selector(drawTextInRect:), @selector(ZZInsets_drawTextInRect:));
    ZZ_best_Swizzle(self, @selector(textRectForBounds:limitedToNumberOfLines:), @selector(ZZTextRectForBounds:limitedToNumberOfLines:));
}
#pragma mark -- ZZContentInsets and set ASSOCIATION ZZShowInsetsKey be true
- (void)setZz_padding:(UIEdgeInsets)zz_padding{
    objc_setAssociatedObject(self, &ZZPaddingKey, NSStringFromUIEdgeInsets(zz_padding), OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &ZZShowPaddingKey, @YES, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UIEdgeInsets)zz_padding{
    return UIEdgeInsetsFromString(objc_getAssociatedObject(self, &ZZPaddingKey));
}

// 修改绘制文字的区域，edgeInsets增加bounds
-(CGRect)ZZTextRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    /*
    调用父类该方法
    注意传入的UIEdgeInsetsInsetRect(bounds, self.edgeInsets),bounds是真正的绘图区域
    */
    CGRect rect = [self ZZTextRectForBounds:UIEdgeInsetsInsetRect(bounds,self.zz_padding) limitedToNumberOfLines:numberOfLines];
    BOOL show = objc_getAssociatedObject(self, &ZZShowPaddingKey);
    if (show) {
        //根据edgeInsets，修改绘制文字的bounds
        rect.origin.x -= self.zz_padding.left;
        rect.origin.y -= self.zz_padding.top;
        rect.size.width += self.zz_padding.left + self.zz_padding.right;
        rect.size.height += self.zz_padding.top + self.zz_padding.bottom;
    }
    return rect;
}

-(void)ZZInsets_drawTextInRect:(CGRect)rect{
    BOOL show = objc_getAssociatedObject(self, &ZZShowPaddingKey);
    if (show) {
         rect = UIEdgeInsetsInsetRect(rect, self.zz_padding);
    }
    [self ZZInsets_drawTextInRect:rect];
}
@end
