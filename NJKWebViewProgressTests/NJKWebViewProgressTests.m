//
//  NJKWebViewProgressTests.m
//
//  Created by Satoshi Aasano on 3/4/17.
//  Copyright (c) 2017 Satoshi Asano. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>
#import "NJKWebViewProgress.h"

@interface NJKWebViewProgressTests<NJKWebViewProgressDelegate> : XCTestCase
@property (nonatomic) NJKWebViewProgress *progressProxy;
@property (nonatomic) UIWebView *webView;
@property (nonatomic) float progressValue;
@property (nonatomic) XCTestExpectation *firstExpectation;
@property (nonatomic) XCTestExpectation *intermidiateExpectation;
@property (nonatomic) BOOL intermidiateLoaded;
@property (nonatomic) XCTestExpectation *loadedExpactation;
@end

@implementation NJKWebViewProgressTests

- (void)setUp {
    [super setUp];

    _webView = [[UIWebView alloc] init];
    _progressProxy = [[NJKWebViewProgress alloc] init];
    _webView.delegate = _progressProxy;
    _progressProxy.webViewProxyDelegate = self;
    _progressProxy.progressDelegate = self;
}

- (void)tearDown {
    [super tearDown];
}

- (void)testLoadWebPage {
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://google.com/"]];
    [_webView loadRequest:req];

    _firstExpectation = [self expectationWithDescription:@"first"];
    _intermidiateExpectation = [self expectationWithDescription:@"interamidiate"];
    _loadedExpactation = [self expectationWithDescription:@"loaded"];

    [self waitForExpectationsWithTimeout:10 handler:^(NSError * _Nullable error) {

    }];
}

#pragma mark - NJKWebViewProgressDelegate

- (void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress {
    if (progress <= 0.1) {
        [_firstExpectation fulfill];
    }

    if (progress > 0.1 && progress < 0.9 && !_intermidiateLoaded) {
        [_intermidiateExpectation fulfill];
        _intermidiateLoaded = YES;
    }

    if (progress >= 1.0) {
        [_loadedExpactation fulfill];
    }

    _progressValue = progress;
}

@end
