//
//  NewDetailViewController.m
//  MyTool
//
//  Created by Jarvan-zhang on 2019/5/16.
//  Copyright © 2019年 Jarvan-zhang. All rights reserved.
//

#import "NewDetailViewController.h"
#import <WebKit/WebKit.h>

@interface NewDetailViewController ()<WKNavigationDelegate>{

    WKWebView       *_wkWebView;
}

@end

@implementation NewDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    _wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-DB_TopHeight) configuration:config];
    _wkWebView.navigationDelegate = self;
    [_wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]]];
    [self.view addSubview:_wkWebView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
