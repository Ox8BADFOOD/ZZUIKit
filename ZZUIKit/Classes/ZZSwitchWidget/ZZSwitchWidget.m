//
//  ZZSwitchWidget.m
//  ZZUIKit
//
//  Created by Max on 2021/3/3.
//

#import "ZZSwitchWidget.h"
#import <ZZUIKit/ZZColor.h>

@implementation ZZSwitchWidget

-(NSBundle *)bundleForRes{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSURL *bundleURL = [bundle URLForResource:@"ZZUIKit" withExtension:@"bundle"];
    NSBundle *resourceBundle = [NSBundle bundleWithURL: bundleURL];
    return resourceBundle;
}

-(void)onInit{
    self.toggle.backgroundColor = [UIColor lightGrayColor];
    self.toggle.layer.cornerRadius = 15.5;
    self.toggle.layer.masksToBounds = true;
}

FLEXSET(toggleBgColor){
    UIColor* clr = colorFromString(sValue,owner) ;
    self.toggle.backgroundColor = clr;
}

FLEXSET(on){
    self.toggle.on = String2BOOL(sValue);
}

FLEXSET(onStr){
    self.toggleLabel.text = sValue;
}

FLEXSET(offStr){
    self.toggleOffLabel.text = sValue;
}

FLEXSET(tintColor){
    UIColor* clr = colorFromString(sValue,owner) ;
    self.toggle.onTintColor = clr;
}

FLEXSET(thumbTintColor){
    UIColor* clr = colorFromString(sValue,owner) ;
    self.toggle.thumbTintColor = clr;
}

FLEXSET(title){
    self.title.text = sValue;
}



@end
