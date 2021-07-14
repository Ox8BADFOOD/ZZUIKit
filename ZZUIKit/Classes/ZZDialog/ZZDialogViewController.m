//
//  ZZDialogViewController.m
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/13.
//

#import "ZZDialogViewController.h"
#import "ZZUIKitEx.h"


@interface ZZDialogViewController ()
@property(nonatomic,strong,readwrite) ZZDialog *dialog;

@end

@implementation ZZDialogViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self == [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
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
    self.definesPresentationContext = true;
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
}

- (void)awakeFromNib{
    [super awakeFromNib];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.dialog];
    __weak typeof(self) weakSelf = self;
    [self.view insertSubview:self.maskView atIndex:0];
    self.maskView.zz_tapAction(^(UIView *v){
      [weakSelf.dialog dismiss];
    });
}

-(ZZMaskView *)maskView{
    if(!_maskView){
        _maskView = [[ZZMaskView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W(), SCREEN_H())];
    }
    return _maskView;
}

#pragma mark -- set
- (void)setMaskColor:(UIColor *)maskColor{
    _maskColor = maskColor;
    self.maskView.maskColor = maskColor;
}

-(void)setBlurStyle:(UIBlurEffectStyle)blurStyle{
    _blurStyle = blurStyle;
    self.maskView.blurStyle = blurStyle;
}

-(void)setDialogDelegate:(id<ZZDialogDelegate>)dialogDelegate{
    _dialogDelegate = dialogDelegate;
    self.dialog.frame = [dialogDelegate preferredFrameForDialog:self.dialog];
    self.dialog.contentDelegate = dialogDelegate;
}

-(void)setHandleDelegate:(id<ZZDialogHandleDelegate>)handleDelegate{
    _handleDelegate = handleDelegate;
    self.dialog.handleDelegate = handleDelegate;
}

-(ZZDialog *)dialog{
    if(!_dialog){
         _dialog = [[ZZDialog alloc] initWithFrame:CGRectMake(SCREEN_W()/4, SCREEN_H()/4, SCREEN_W()/2, SCREEN_H()/2)];
    }
    return _dialog;
}
@end
