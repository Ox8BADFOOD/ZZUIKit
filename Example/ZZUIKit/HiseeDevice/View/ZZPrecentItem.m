//
//  ZZPrecentItem.m
//  ZZUIKit_Example
//
//  Created by Max on 2021/1/20.
//  Copyright © 2021 bymiracles@163.com. All rights reserved.
//

#import "ZZPrecentItem.h"
#import <ZZUIKitEx/ZZUIKitEx.h>
@interface ZZPrecentItem()
{
    UILabel * _stateLab;
    UILabel * _timesLab;
    UIView * _circleView;
    UILabel * _percentLab;
}
@property(nonatomic,strong) CAShapeLayer *bgLayer;
@property(nonatomic,strong) CAShapeLayer *foreLayer;
@end

@implementation ZZPrecentItem


-(void)onInit{
    self.flexibleWidth = YES;
    self.flexibleHeight = YES;
    [_circleView.layer addSublayer:self.bgLayer];
    [_circleView.layer addSublayer:self.foreLayer];
//    CGAffineTransform transform = CGAffineTransformMakeRotation(-M_PI_2);
//    _circleView.transform = transform;
    [self setPrecent:99.5];
}

- (void)setPrecent:(float)precent
{
    NSString *str = [NSString stringWithFormat:@"%.1f%%",precent];
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange range = NSMakeRange(0, str.length - 1);
    [attriStr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:25]} range:range];
    _percentLab.attributedText = attriStr;
    
    //_foreLayer
    _foreLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(IHDeviceCircleItemRadius, IHDeviceCircleItemRadius) radius:IHDeviceCircleItemRadius startAngle:-0.5*M_PI endAngle:-2.5*M_PI * (precent/100.0) clockwise:false].CGPath;
}

-(CAShapeLayer *)bgLayer{
    if(!_bgLayer){
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(IHDeviceCircleItemRadius, IHDeviceCircleItemRadius) radius:IHDeviceCircleItemRadius startAngle:0 endAngle:M_PI*2 clockwise:YES];
        _bgLayer = [CAShapeLayer layer];
        _bgLayer.lineWidth = 5.0;
        _bgLayer.strokeColor = zz_RGBHex(0xF5F5F5).CGColor;
        _bgLayer.fillColor = nil;
        _bgLayer.path = path.CGPath;
    }
    return _bgLayer;
}

-(CAShapeLayer *)foreLayer{
    if(!_foreLayer){
        _foreLayer = [CAShapeLayer layer];
        _foreLayer.lineWidth = 5.0;
        _foreLayer.strokeColor = zz_RGBHex(0xFDCA04).CGColor;
        _foreLayer.fillColor = nil;
    }
    return _foreLayer;
}
@end
