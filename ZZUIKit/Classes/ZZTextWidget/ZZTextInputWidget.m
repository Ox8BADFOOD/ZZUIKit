//
//  ZZTextInputWidget.m
//  ZZUIKit
//
//  Created by Max on 2021/4/6.
//

#import "ZZTextInputWidget.h"
#import <ZZUIKit/ZZColor.h>

@interface ZZTextInputWidget()
@property(nonatomic,strong) UILabel *countLab;
@property(nonatomic,strong) FlexTextView *textView;
@end

@implementation ZZTextInputWidget

-(void)onInit{
    _currentCount = 0;
    self.maxCount = 100;
    self.placehold = @"请输入";
    self.countLab.text = [NSString stringWithFormat:self.countFormat,_currentCount,_maxCount];
    self.textView.placeholder = self.placehold;
    self.textView.font = [UIFont systemFontOfSize:15];
    self.countLab.font = [UIFont systemFontOfSize:15];
    self.textView.textColor = zz_RGBHex(0x333333);
    self.countLab.textColor = zz_RGBHex(0xCCCCCC);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(placeholderTextViewdidChange:) name:UITextViewTextDidChangeNotification object:self.textView];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)placeholderTextViewdidChange:(NSNotification *)notificat{
    FlexTextView *textView = (FlexTextView *)notificat.object;
    if ((textView.text.length > _maxCount) &&
        (_maxCount != 0) &&
        (textView.markedTextRange == nil)) {
        textView.text = [textView.text substringToIndex:_maxCount];
    }
    _currentCount = textView.text.length > _maxCount ? _maxCount : textView.text.length;
    self.countLab.text = [NSString stringWithFormat:self.countFormat,_currentCount,_maxCount];
}

-(void)setMaxCount:(NSInteger)maxCount{
    _maxCount = maxCount;
    self.countLab.text = [NSString stringWithFormat:self.countFormat,_currentCount,_maxCount];
}

-(void)setPlacehold:(NSString *)placehold{
    _placehold = placehold;
    self.textView.placeholder = placehold;
}

FLEXSET(placehold){
    self.placehold = sValue;
}

FLEXSET(maxCount){
    self.maxCount = [sValue intValue];
}

FLEXSET(font){
    UIFont* font = fontFromString(sValue);
    self.textView.font = font;
}

FLEXSET(countFont){
    UIFont* font = fontFromString(sValue);
    self.countLab.font = font;
}

FLEXSET(countFormat){
    self.countFormat = sValue;
    self.countLab.text = [NSString stringWithFormat:self.countFormat,_currentCount,_maxCount];
}

-(NSString *)countFormat{
    if (_countFormat) {
        return _countFormat;
    }
    return @"%zd/%zd";
}

-(NSBundle *)bundleForRes{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSURL *bundleURL = [bundle URLForResource:@"ZZUIKit" withExtension:@"bundle"];
    NSBundle *resourceBundle = [NSBundle bundleWithURL: bundleURL];
    return resourceBundle;
}

-(void)setText:(NSString *)text{
    _textView.text = text;
}

-(NSString *)text{
    return _textView.text;
}
@end
