//
//  ZZInfoWidget.m
//  ZZUIKit
//
//  Created by Max on 2021/3/3.
//

#import "ZZInfoWidget.h"

@implementation ZZInfoWidget

-(NSBundle *)bundleForRes{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSURL *bundleURL = [bundle URLForResource:@"ZZUIKit" withExtension:@"bundle"];
    NSBundle *resourceBundle = [NSBundle bundleWithURL: bundleURL];
    return resourceBundle;
}

-(void)onInit{

}

FLEXSET(title){
    self.title.text = sValue;
}

FLEXSET(placeholder){
    self.field.placeholder = sValue;
}

FLEXSET(edit){
    self.field.enabled = String2BOOL(sValue);
    self.field.placeholder = @"";
}

FLEXSET(line){
    self.line.hidden = !String2BOOL(sValue);
}

FLEXSET(font){
    UIFont* font = fontFromString(sValue);
    self.title.font = font;
    self.field.font = font;
}

@end
