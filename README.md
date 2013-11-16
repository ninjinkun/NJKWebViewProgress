# NJKWebViewProgress
NJKWebViewProgress is a progress interface library for UIWebView. Currently, UIWebView don't have official progress interface. You can implement progress bar for your in-app browser using this module.

<img src="https://raw.github.com/ninjinkun/NJKWebViewProgress/master/DemoApp/Screenshot/screenshot1.png" alt="iOS ScreenShot 1" width="240px" style="width: 240px;" />

NJKWebViewProgress don't use CocoaTouch's private methods. It's AppStore safe.

# Requirements
- iOS 4.3 or later
- ARC

# Usage
Instance `NJKWebViewProgress` and set `UIWebViewDelegate`. If you set `webViewProxyDelegate`, `NJKWebViewProgress` suould perform as a proxy object.

```objc
NJKWebViewProgress *progressProxy = [[NJKWebViewProgress alloc] init];
webView.delegate = progressProxy;
progressProxy.webViewProxyDelegate = self;
progressProxy.progressDelegate = self;
```

When UIWebView start loading, `NJKWebViewProgress` call delegate method and block with progress.
```objc
-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    [progressView setProgress:progress animated:NO];
}
```

```objc
progressProxy.progressBlock = ^(float progress) {
    [progressView setProgress:progress animated:NO];
};
```

This repository contains iOS 7 Safari style bar `NJKWebViewProgressView`. You can choose `NJKWebViewProgressView`, `UIProgressView` or your custom bar.

# Install
## CocoaPods

```
pod 'NJKWebViewProgress'
```

# License
[Apache]: http://www.apache.org/licenses/LICENSE-2.0
[MIT]: http://www.opensource.org/licenses/mit-license.php
[GPL]: http://www.gnu.org/licenses/gpl.html
[BSD]: http://opensource.org/licenses/bsd-license.php
[MIT license][MIT].
