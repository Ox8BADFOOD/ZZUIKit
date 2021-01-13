//
//  UIImage+ZZEx.m
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/7.
//

#import "UIImage+ZZEx.h"

UIImage * _Nullable  zz_imgNamed(NSString* _Nonnull name){
    return [UIImage imageNamed:name];
};

@implementation UIImage (ZZEx)
+(UIImage *)zz_imageWithColor:(UIColor *)color size:(CGSize)size{
    CGRect rect = CGRectMake(0.0f,0.0f,size.width,size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

-(UIImage *)zz_tintColor:(UIColor *)tintColor{
    // 获取图片大小
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    // 创建位图绘图上下文
    UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale);
    // 获取位图绘图上下文并开始渲染操作
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawInRect:rect];
    
    // 全局渲染成需要的颜色(会和图片进行混合, 只要设置成混合模式是kCGBlendModeSourceAtop, 就能得到图片轮廓但是图颜色是我们需要的颜色)
    [tintColor setFill];
    // 纯色图片渲染的关键设置
    CGContextSetBlendMode(context, kCGBlendModeSourceAtop);
    // 全局渲染颜色
    CGContextFillRect(context, rect);
    // 获取到绘图结果，结束位图绘图上下文并返回绘图结果
    UIImage *resulet = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resulet;
}

-(UIImage *)zz_redrawWithSize:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
@end
