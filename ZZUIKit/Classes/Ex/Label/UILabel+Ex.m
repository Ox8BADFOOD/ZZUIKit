//
//  UILabel+Ex.m
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/9.
//

#import "UILabel+Ex.h"
#import <ZZFoundation/ZZFoundation.h>
@implementation UILabel (Ex)

-(CGFloat)zz_heigt:(CGFloat)limitW{
    limitW = limitW == 0 ? CGFLOAT_MAX : limitW;
    return self.text.ZZRectHeigh(CGFLOAT_MAX,self.font);
}

-(CGFloat)zz_width:(CGFloat)limitH{
    limitH = limitH == 0 ? CGFLOAT_MAX : limitH;
    return self.text.ZZRectWidth(limitH,self.font);
}


@end
