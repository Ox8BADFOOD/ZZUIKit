//
//  UILabel+Ex.h
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Ex)

/// 根据宽度算高度
/// @param limitW  不传或者传0 就是不限制
-(CGFloat)zz_heigt:(CGFloat)limitW;

/// 根据高度算出宽度
/// @param limitH  不传或者传0 就是不限制
-(CGFloat)zz_width:(CGFloat)limitH;


@end

NS_ASSUME_NONNULL_END
