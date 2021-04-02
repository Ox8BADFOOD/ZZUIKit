//
//  ZZOption.m
//  ZZUIKit
//
//  Created by Max on 2021/3/9.
//

#import "ZZOption.h"
#import <ZZUIKit/ZZUIKitEx.h>

@interface ZZOption()
@property(nonatomic,copy) NSString *title;
@end

@implementation ZZOption

//-(NSBundle *)bundleForRes{
//    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
//    NSURL *bundleURL = [bundle URLForResource:@"ZZUIKit" withExtension:@"bundle"];
//    NSBundle *resourceBundle = [NSBundle bundleWithURL: bundleURL];
//    return resourceBundle;
//}

-(UILabel *)titleLab{
    if(!_titleLab){
        _titleLab = [[UILabel alloc] init];
        _titleLab.text = _title;
        _titleLab.textAlignment = NSTextAlignmentCenter;
        [_titleLab setLayoutAttr:@"flex" Value:@"1"];
        [_titleLab enableFlexLayout:true];
    }
    return _titleLab;
}

-(void)onInit{
    _selTextColor = @"#333333";
    _unselTextColor = @"#333333";
    _reverse = true;
    UIView *frameView = [self valueForKey:@"frameView"];
    [frameView addSubview:self.titleLab];
    self.selected = false;
    @weakify(self);
    self.zz_tapAction(^(UIView *view){
        @strongify(self);
        [self onClick];
    });
}

-(void)postRadioNotification{
    if ([self.superview isKindOfClass:NSClassFromString(@"ZZSelect")] || [self.superview isKindOfClass:NSClassFromString(@"ZZRadio")]) {
        [self.superview performSelector:@selector(onClick)];
    }
}

-(void)onClick{
    if (_clickEvent) {/*自定义点击逻辑*/
        _clickEvent(self);
    }else{/*默认自带逻辑*/
        self.selected = _reverse ? !_selected : true;
        [self postRadioNotification];
    }
}

-(void)setSelected:(BOOL)selected{
    _selected = selected;
     if (!_selBorderColor) {
       _selBorderColor = _selBgc;
    }
    if (!_unselBorderColor) {
       _unselBorderColor = _unselBgc;
    }
    self.layer.borderColor = _selected ? colorFromString(_selBorderColor, nil).CGColor:colorFromString(_unselBorderColor, nil).CGColor;
    self.layer.borderWidth = 1;
    
    if (_selBgc && _unselBgc) {
        self.backgroundColor = _selected ?colorFromString(_selBgc, nil):colorFromString(_unselBgc, nil);
    }
    self.titleLab.textColor = _selected ? colorFromString(_selTextColor, nil) : colorFromString(_unselTextColor, nil);
}

FLEXSET(reverse){
    self.reverse = String2BOOL(sValue);
}

FLEXSET(selected){
    self.selected = String2BOOL(sValue);
}

FLEXSET(selTextColor){
    self.selTextColor = sValue;
    self.selected = self.selected;
}

FLEXSET(unselTextColor){
    self.unselTextColor = sValue;
    self.selected = self.selected;
}

FLEXSET(selBgc){
    self.selBgc = sValue;
    self.selected = self.selected;
}

FLEXSET(unselBgc){
    self.unselBgc = sValue;
    self.selected = self.selected;
}

FLEXSET(selBorderColor){
    self.selBorderColor = sValue;
    self.selected = self.selected;
}

FLEXSET(unselBorderColor){
    self.unselBorderColor = sValue;
    self.selected = self.selected;
}

FLEXSET(title){
    self.title = sValue;
    self.titleLab.text = sValue;
}
@end
