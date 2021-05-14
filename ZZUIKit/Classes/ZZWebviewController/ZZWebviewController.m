//
//  ZZWebviewController.m
//  ZZUIKit
//
//  Created by Max on 2021/5/14.
//

#import "ZZWebviewController.h"
#import <WebKit/WebKit.h>
#import <ZZUIKit/ZZColor.h>
#import "ZZFrame.h"

@interface ZZWebviewController ()<WKNavigationDelegate,WKNavigationDelegate>
@property(nonatomic,strong) WKWebView *webView;
@end

@implementation ZZWebviewController

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self == [super initWithCoder:coder]) {
        [self commonInit];
    }
    return self;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self == [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self commonInit];
    }
    return  self;
}

-(void)commonInit{
    self.webView.backgroundColor = [UIColor whiteColor];
}

-(void)setLoadURL:(NSString *)loadURL{
    _loadURL = loadURL;
//    NSString *urlStr = ZZString(@"http://njmb-h5.hiseemedical.com/#/equipmentList?token=%@&platform=APP",token);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:loadURL]];
    [_webView loadRequest:request];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configUI];
}

-(void)configUI{
    self.view.backgroundColor = zz_RGBHex(0xffffff);
    [self.view addSubview:self.webView];
    if (@available(iOS 11.0, *)) {
        self.webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = false;
    }
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.webView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

-(WKWebView *)webView{
    if(!_webView){
        _webView = [[WKWebView alloc] init];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        _webView.scrollView.contentInset = UIEdgeInsetsMake(self.navigationController.navigationBarHidden || !self.navigationController.navigationBar.isTranslucent ? 0 : NAV_STATUS_BAR_H(), 0, BOTTOM_PADDING(), 0);
    }
    return _webView;
}

#pragma mark - WKNavigationDelegate
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
 
}
@end
