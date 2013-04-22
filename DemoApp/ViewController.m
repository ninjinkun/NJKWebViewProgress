//
//  ViewController.m
//  WebViewDemo
//
//  Created by Satoshi Asano on 4/20/13.
//  Copyright (c) 2013 Satoshi Asano. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
{
    IBOutlet __weak UIWebView *_webView;
    IBOutlet __weak UIProgressView *_progressView;
    NJKWebViewProgress *_progressProxy;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _progressProxy = [[NJKWebViewProgress alloc] init];
    _webView.delegate = _progressProxy;
    _progressProxy.webViewProxyDelegate = self;
    _progressProxy.progressDelegate = self;

    [self loadGoogle];
}

- (IBAction)searchButtonPushed:(id)sender
{
    [self loadGoogle];
}

- (IBAction)reloadButtonPushed:(id)sender
{
    [_webView reload];
}

-(void)loadGoogle
{
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://google.com/"]];
    [_webView loadRequest:req];
}

#pragma mark - NJKWebViewProgressDelegate
-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    if (progress == 0.0) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        _progressView.progress = 0;
        [UIView animateWithDuration:0.27 animations:^{
            _progressView.alpha = 1.0;
        }];
    }
    if (progress == 1.0) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [UIView animateWithDuration:0.27 delay:progress - _progressView.progress options:0 animations:^{
            _progressView.alpha = 0.0;
        } completion:nil];
    }
        
    [_progressView setProgress:progress animated:NO];
}

@end
