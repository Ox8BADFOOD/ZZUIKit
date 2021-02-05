//
//  UIButton+ZZEx.m
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/7.
//

#import "UIButton+ZZEx.h"
#import "UIImage+ZZEx.h"
#import "objc/runtime.h"

typedef NS_ENUM(NSUInteger, ZZBtnStyle) {
    ZZBtnStyleNormal,
    ZZBtnStyleReverse,
    ZZBtnStyleUpsidedown,
    ZZBtnStyleDownsideup,
};

@implementation UIButton (ZZEx)

static void *zz_bgcKey = &zz_bgcKey;
-(void)setZz_bgc:(NSMutableDictionary<NSNumber *,UIColor *> *)zz_bgc{
    objc_setAssociatedObject(self, &zz_bgcKey, zz_bgc, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSMutableDictionary<NSNumber *,UIColor *> *)zz_bgc{
    return objc_getAssociatedObject(self, &zz_bgcKey);
}

-(void)setZz_backgroundColor:(UIColor *)color forState:(UIControlState)state{
    if (!self.zz_bgc) {
        self.zz_bgc = [NSMutableDictionary dictionary];
    }
    self.zz_bgc[@(state)] = color;
    UIImage *colorImg1 = [UIImage zz_imageWithColor:color size:CGSizeMake(1, 1)];
    [self setBackgroundImage:colorImg1 forState:state];
};

-(UIColor *)zz_backgroundColorForState:(UIControlState)state{
    return [UIColor colorWithCGColor:self.zz_bgc[@(state)].CGColor];
}



// 添加点击事件的链式调用
- (UIButton *(^)(ZZControlEventsBlock))zz_click{
    return ^UIButton *(ZZControlEventsBlock block){
        return (UIButton *)self.zz_eventFire(block , UIControlEventTouchUpInside);
    };
}

-(void)zz_contentReverse_simple{
    self.semanticContentAttribute = UISemanticContentAttributeForceRightToLeft;
}

-(void)zz_contentNormal:(CGFloat)space{
    [self zz_layoutWidgets:ZZBtnStyleNormal space:space];
}

-(void)zz_contentReverse:(CGFloat)space{
    [self zz_layoutWidgets:ZZBtnStyleReverse space:space];
}

-(void)zz_contentUpsidedown:(CGFloat)space{
   [self zz_layoutWidgets:ZZBtnStyleUpsidedown space:space];
}

-(void)zz_contentDownsideup:(CGFloat)space{
    [self zz_layoutWidgets:ZZBtnStyleDownsideup space:space];
}

-(void)zz_layoutWidgets:(ZZBtnStyle)style space:(CGFloat)spacing{
    CGFloat imageWidth = self.currentImage.size.width;
    CGFloat imageHeight = self.currentImage.size.height;
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wdeprecated-declarations"
    // Single line, no wrapping. Truncation based on the NSLineBreakMode.
    CGSize size = [self.currentTitle sizeWithFont:self.titleLabel.font];
    CGFloat labelWidth = size.width;
    CGFloat labelHeight = size.height;
    #pragma clang diagnostic pop
    CGFloat imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
       
    CGFloat tempWidth = MAX(labelWidth, imageWidth);
    CGFloat changedWidth = labelWidth + imageWidth - tempWidth;
    CGFloat tempHeight = MAX(labelHeight, imageHeight);
    CGFloat changedHeight = labelHeight + imageHeight + spacing - tempHeight;
       
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets titleEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets contentEdgeInsets = UIEdgeInsetsZero;
    switch (style) {
        case ZZBtnStyleNormal:
            imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
            break;
            
        case ZZBtnStyleReverse:
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
            titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth + spacing/2), 0, imageWidth + spacing/2);
            contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
            break;
            
        case ZZBtnStyleUpsidedown:
            imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            contentEdgeInsets = UIEdgeInsetsMake(imageOffsetY, -changedWidth/2, changedHeight-imageOffsetY, -changedWidth/2);
            break;
            
        case ZZBtnStyleDownsideup:
            imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            contentEdgeInsets = UIEdgeInsetsMake(changedHeight-imageOffsetY, -changedWidth/2, imageOffsetY, -changedWidth/2);
            break;
        default:
            break;
    }
    self.imageEdgeInsets = imageEdgeInsets;
    self.titleEdgeInsets = titleEdgeInsets;
    self.contentEdgeInsets = contentEdgeInsets;
}


+ (UIButton *(^)(UIButtonType))ZZButton {
    return ^UIButton *(UIButtonType type) {
        
        return [UIButton buttonWithType:type];
    };
}

- (UIButton *(^)(NSAttributedString *title, UIControlState status))ZZAttributedTitle {
    return ^UIButton *(NSAttributedString *titleName, UIControlState status) {
        [self setAttributedTitle:titleName forState:status];
        return self;
    };
}


- (UIButton *(^)(NSString *title, UIControlState status))ZZTitle {
    return ^UIButton *(NSString *titleName, UIControlState status) {
        [self setTitle:titleName forState:status];
        return self;
    };
}


- (UIButton *(^)(UIImage *backgroundImage,UIControlState status))ZZBgImage {
    return ^UIButton *(UIImage *backgroundImage,UIControlState status){
        [self setBackgroundImage:backgroundImage forState:status];
        return self;
    };
}

- (UIButton *(^)(UIColor * backgroundColor))ZZBgc {
    return ^UIButton *(UIColor * bgColor){
        [self setBackgroundColor:bgColor];
        return self;
    };
}

- (UIButton *(^)(UIColor *borderColor,CGFloat borderWidth))ZZBorder {

    return ^UIButton *(UIColor *borderColor,CGFloat borderWidth) {
        self.layer.borderColor = borderColor.CGColor;
        self.layer.borderWidth = borderWidth;
        return self;
    };
}

- (UIButton *(^)(UIColor *))ZZTitleColor {
   return ^UIButton *(UIColor *titleColor){
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(UIColor *,UIControlState))ZZTitleColor2{
   return ^UIButton *(UIColor *titleColor,UIControlState status){
        [self setTitleColor:titleColor forState:status];
        return self;
    };
}

- (UIButton *(^)(UIImage *, UIControlState))ZZShowImage {
    return ^UIButton * (UIImage *currentImage,UIControlState status) {
        [self setImage:currentImage forState:status];
        return self;
    };
}

- (UIButton *(^)(UIViewContentMode mode))ZZShowImageContentMode{
    return ^UIButton * (UIViewContentMode mode) {
        self.imageView.contentMode = mode;
        return self;
    };
}

- (UIButton *(^)(CGRect frame))ZZSetFrame{
    return ^UIButton *(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UIButton *(^)(UIFont *font))ZZFont{
    return ^UIButton *(UIFont *font){
        self.titleLabel.font = font;
        return self;
    };
}

- (UIButton *(^)(CGFloat))ZZCornerRadius {
    return ^UIButton *(CGFloat radius) {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = true;
        return self;
    };
}
@end
