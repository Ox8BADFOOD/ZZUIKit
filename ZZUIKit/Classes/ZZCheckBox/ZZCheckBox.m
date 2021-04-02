//
//  ZZCheckBox.m
//  ZZUIKit
//
//  Created by Max on 2021/3/3.
//

#import "ZZCheckBox.h"
#import <ZZUIKit/ZZUIKitEx.h>

@interface ZZCheckBox()

@end

@implementation ZZCheckBox

-(NSBundle *)bundleForRes{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSURL *bundleURL = [bundle URLForResource:@"ZZUIKit" withExtension:@"bundle"];
    NSBundle *resourceBundle = [NSBundle bundleWithURL: bundleURL];
    return resourceBundle;
}

-(void)onInit{
    _imgV.hidden = true;
    _selected = false;
    _reverse = true;
    _titleLab.textAlignment = NSTextAlignmentLeft;
    @weakify(self);
    self.zz_tapAction(^(UIView *view){
        @strongify(self);
        [self onClick];
    });
}

-(void)postRadioNotification{
    if ([self.superview isKindOfClass:NSClassFromString(@"ZZRadio")]) {
        [self.superview performSelector:@selector(onClick)];
    }
}

-(void)onClick{
    if (_clickEvent) {/*自定义点击逻辑*/
        _clickEvent(self);
    }else{/*默认自带逻辑*/
        self.selected = _reverse ? !_selected : true;
        if (self.selected) {[self postRadioNotification];}
    }
}

-(void)setSelected:(BOOL)selected{
    _selected = selected;
    _imgV.image = _selected ? self.selImg : self.unselImg;
}

FLEXSET(reverse){
    self.reverse = String2BOOL(sValue);
}

FLEXSET(selected){
    self.selected = String2BOOL(sValue);
}

#pragma mark -- 图片样式
FLEXSET(selImg){
    UIImage* img = [UIImage imageNamed:sValue inBundle:[owner bundleForImages] compatibleWithTraitCollection:nil];
    self.selImg = img;
    self.imgV.hidden = false;
    self.selected = self.selected;
}

FLEXSET(unselImg){
    UIImage* img = [UIImage imageNamed:sValue inBundle:[owner bundleForImages] compatibleWithTraitCollection:nil];
    self.unselImg = img;
    self.imgV.hidden = false;
    self.selected = self.selected;
}

FLEXSET(title){
    self.titleLab.text = sValue;
}
@end
