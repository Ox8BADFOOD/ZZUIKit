//
//  ZZMaskViewController.m
//  Aspects
//
//  Created by Max on 2021/1/18.
//

#import "ZZMaskViewController.h"

@interface ZZMaskViewController ()

@end

@implementation ZZMaskViewController

-(instancetype)initWithCoder:(NSCoder *)coder{
    return  [self initWithBlurStyle:UIBlurEffectStyleExtraLight alpha:0.85];
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    return  [self initWithBlurStyle:UIBlurEffectStyleExtraLight alpha:0.85];
}

-(instancetype)initWithBlurStyle:(UIBlurEffectStyle)style alpha:(CGFloat)alpha{
    if (self == [super initWithNibName:nil bundle:nil]) {
        ZZMaskView *maskView = (ZZMaskView *)self.view;
        maskView.alpha = alpha;
        maskView.blurStyle = style;
    }
    return self;
}

-(instancetype)initWithMaskColor:(UIColor *)color alpha:(CGFloat)alpha{
    if (self == [super initWithNibName:nil bundle:nil]) {
        ZZMaskView *maskView = (ZZMaskView *)self.view;
        maskView.alpha = alpha;
        maskView.maskColor = color;
    }
    return self;
}

-(void)loadView{
    ZZMaskView *maskView= [[ZZMaskView alloc] init];
    self.view = maskView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
