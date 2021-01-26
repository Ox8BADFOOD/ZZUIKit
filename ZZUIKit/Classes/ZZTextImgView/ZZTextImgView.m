//
//  ZZTextImgView.m
//  Pods
//
//  Created by Max on 2021/1/14.
//

#import "ZZTextImgView.h"

@implementation ZZTextImgView

-(instancetype)initWithDirection:(ZZDirection)direction widgetAlign:(ZZTextImgAlign)widgetAlign{
    if (self == [super init]) {
        self.axis = direction;
        _lab = [[UILabel alloc] init];
        _imgV = [[UIImageView alloc] init];
        [self addArrangedSubview:_imgV];
        if (widgetAlign == ZZTextImgAlignNormal) {
            [self addArrangedSubview:_lab];
        }else{
            [self insertArrangedSubview:_lab atIndex:0];
        }
        
        self.distribution = UIStackViewDistributionFill;
        self.alignment = UIStackViewAlignmentCenter;
    }
    return self;
}

@end
