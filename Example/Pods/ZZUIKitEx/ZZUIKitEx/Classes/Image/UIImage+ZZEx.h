//
//  UIImage+ZZEx.h
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/7.
//

#import <UIKit/UIKit.h>
FOUNDATION_EXPORT UIImage * _Nullable zz_imgNamed(NSString* _Nonnull name);

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ZZEx)
/**
 *   创建指定颜色大小的图片
 *   param size 指定的区域
 *   color color 图片的颜色
 */
+(UIImage *)zz_imageWithColor:(UIColor *)color size:(CGSize)size;

/// 渲染图片
/// @param tintColor 渲染的颜色
-(UIImage *)zz_tintColor:(UIColor *)tintColor;

/// 在规定大小重绘图片
/// @param size 规定大小
-(UIImage *)zz_redrawWithSize:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
