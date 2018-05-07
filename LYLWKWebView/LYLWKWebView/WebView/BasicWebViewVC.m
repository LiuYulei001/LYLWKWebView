//
//  BasicWebViewVC.m
//  LYLWKWebView
//
//  Created by Rainy on 2018/5/7.
//  Copyright © 2018年 Rainy. All rights reserved.
//

#import "BasicWebViewVC.h"

#import "LYLWKWebView.h"

@interface BasicWebViewVC ()<WKNavigationDelegate>

@property(nonatomic,strong)LYLWKWebView *webViewManager;

@end

@implementation BasicWebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)webViewloadRequestWithURLString:(NSString *)URLSting
{
    [self.webViewManager.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:URLSting]]];
}

#pragma mark - <WKNavigationDelegate>
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    //"webViewDidStartLoad"
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    //"webViewDidFinishLoad"
}
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation
{
    //"webViewDidFailLoad"
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler
{
    //"webViewWillLoadData"
    decisionHandler(WKNavigationResponsePolicyAllow);
}
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler
{
    //"webViewWillAuthentication"
    completionHandler(NSURLSessionAuthChallengePerformDefaultHandling , nil);
}

#pragma mark - lazy
-(LYLWKWebView *)webViewManager
{
    if (!_webViewManager) {
        
        _webViewManager = [[LYLWKWebView alloc] initWithFrame:self.view.bounds];
        _webViewManager.webView.navigationDelegate = self;
        [self.view addSubview:_webViewManager];
    }
    return _webViewManager;
}


@end
