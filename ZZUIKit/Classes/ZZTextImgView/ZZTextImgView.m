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
        _lab = [[UILabel alloc] init];
        _imgV = [[UIImageView alloc] init];
        
        _inner = [[UIStackView alloc] init];
        _inner.axis = direction;
        [_inner addArrangedSubview:_imgV];
        if (widgetAlign == ZZTextImgAlignNormal) {
            [_inner addArrangedSubview:_lab];
        }else{
            [_inner insertArrangedSubview:_lab atIndex:0];
        }
        _inner.distribution = UIStackViewDistributionFill;
        _inner.alignment = UIStackViewAlignmentCenter;
        
        [self addArrangedSubview:_inner];
        self.axis = direction == ZZDirectionVertical ? ZZDirectionHorizontal : ZZDirectionVertical;
        self.distribution = UIStackViewDistributionEqualSpacing;
        self.alignment = UIStackViewAlignmentCenter;
    }
    return self;
}

@end
