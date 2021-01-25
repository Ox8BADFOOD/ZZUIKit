//
//  ZZItemInfo.m
//  Pods
//
//  Created by Max on 2021/1/18.
//

#import "ZZItemInfo.h"
#import <ZZUIKitEx/ZZUIKitEx.h>
#import <Masonry/Masonry.h>

@interface ZZItemInfo()
@property(nonatomic,strong) UIStackView *titleStack;
@property(nonatomic,strong) UIStackView *rightStack;
@end

@implementation ZZItemInfo

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self == [super initWithCoder:coder]) {
        [self commonInit];
    }
    return self;
}

-(void)commonInit{
    _edgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    _imgTitleSpaceH = 10;
    _rightSpaceV = 5;
    [self addSubview:self.imgView];
    [self.rightStack addArrangedSubview:self.titleLab];
    [self.rightStack addArrangedSubview:self.detailTitleLab];
    [self addSubview:self.rightStack];
    [self configLayout];
    [self addObserver:self forKeyPath:@"titleLab.text" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:NULL];
    [self addObserver:self forKeyPath:@"detailTitleLab.text" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:NULL];
}

-(void)configLayout{
    //添加约束
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(self.edgeInsets.left);
        make.centerY.mas_equalTo(self);
        make.top.mas_greaterThanOrEqualTo(self).offset(self.edgeInsets.top);
        make.bottom.mas_lessThanOrEqualTo(self).offset(-self.edgeInsets.bottom);
    }];
    
    [self.rightStack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgView.mas_right).offset(self.imgTitleSpaceH);
        make.centerY.mas_equalTo(self);
        make.top.mas_greaterThanOrEqualTo(self).offset(self.edgeInsets.top);
        make.bottom.mas_lessThanOrEqualTo(self).offset(-self.edgeInsets.bottom);
        make.right.mas_greaterThanOrEqualTo(self).offset(-self.edgeInsets.right);
    }];
}

-(void)zz_updateConstraints{
//    if (!self.superview) return;
    if (!self.imgView.superview || !self.titleLab.superview || !self.detailTitleLab.superview) {
        return;
    }
    //修改约束
    [self.imgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(self.edgeInsets.left);
//        make.centerY.mas_equalTo(self);
        make.top.mas_greaterThanOrEqualTo(self).offset(self.edgeInsets.top);
        make.bottom.mas_lessThanOrEqualTo(self).offset(-self.edgeInsets.bottom);
    }];
    
    [self.rightStack mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgView.mas_right).offset(self.imgTitleSpaceH);
//        make.centerY.mas_equalTo(self);
        make.top.mas_greaterThanOrEqualTo(self).offset(self.edgeInsets.top);
        make.bottom.mas_lessThanOrEqualTo(self).offset(-self.edgeInsets.bottom);
        make.right.mas_greaterThanOrEqualTo(self).offset(-self.edgeInsets.right);
    }];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath hasPrefix:@"titleLab"]) {
        self.titleLab.hidden = self.titleLab.text.length == 0;
    }else if([keyPath hasPrefix:@"subTitleLab"]){
        self.detailTitleLab.hidden = self.detailTitleLab.text.length == 0;
    }
}

-(UIImageView *)imgView{
    if(!_imgView){
        _imgView = [[UIImageView alloc] init];
    }
    return _imgView;
}

-(UIStackView *)rightStack{
    if(!_rightStack){
        _rightStack = [[UIStackView alloc] init];
        _rightStack.axis = UILayoutConstraintAxisVertical;
        _rightStack.distribution = UIStackViewDistributionFill;
        _rightStack.alignment = UIStackViewAlignmentLeading;
        _rightStack.spacing = self.rightSpaceV;
    }
    return _rightStack;
}

-(UIStackView *)titleStack{
    if(!_titleStack){
        _titleStack = [[UIStackView alloc] init];
        _rightStack.axis = UILayoutConstraintAxisVertical;
        _rightStack.distribution = UIStackViewDistributionFill;
        _rightStack.alignment = UIStackViewAlignmentLeading;
    }
    return _titleStack;
}

-(UILabel *)titleLab{
    if(!_titleLab){
        _titleLab = [UILabel new];
        _titleLab.textColor = zz_RGBHex(0x333333);
        _titleLab.font = [UIFont systemFontOfSize:16];
    }
    return _titleLab;
}

-(UILabel *)titleDescripLab{
    if(!_titleDescripLab){
        _titleDescripLab = [UILabel new];
        _titleLab.textColor = zz_RGBHex(0x333333);
        _titleLab.font = [UIFont systemFontOfSize:16];
    }
    return _titleDescripLab;
}

-(UILabel *)detailTitleLab{
    if(!_detailTitleLab){
        _detailTitleLab = [UILabel new];
        _detailTitleLab.textColor = zz_RGBHex(0x333333);
        _detailTitleLab.font = [UIFont systemFontOfSize:12];
    }
    return _detailTitleLab;
}

-(void)setEdgeInsets:(UIEdgeInsets)edgeInsets{
    if (![NSStringFromUIEdgeInsets(_edgeInsets) isEqualToString:NSStringFromUIEdgeInsets(edgeInsets)]) {
        _edgeInsets = edgeInsets;
        [self zz_updateConstraints];
    }else{
        _edgeInsets = edgeInsets;
    }
}

-(void)setRightSpaceV:(CGFloat)titlesSpaceV{
    if (_rightSpaceV != titlesSpaceV) {
        _rightSpaceV = titlesSpaceV;
         self.rightStack.spacing = titlesSpaceV;
    }else{
        _rightSpaceV = titlesSpaceV;
    }
}

-(void)setImgTitleSpaceH:(CGFloat)imgTitleSpaceH{
    if (_imgTitleSpaceH != imgTitleSpaceH) {
        _imgTitleSpaceH = imgTitleSpaceH;
        [self zz_updateConstraints];
    }else{
        _imgTitleSpaceH = imgTitleSpaceH;
    }
}

-(void)dealloc{
    [self removeObserver:self forKeyPath:@"titleLab.text"];
    [self removeObserver:self forKeyPath:@"detailTitleLab.text"];
}
@end
