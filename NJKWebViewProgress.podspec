Pod::Spec.new do |s|
  s.name         = "NJKWebViewProgress"
  s.version      = "0.1.4"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.summary      = "UIWebView progress interface."
  s.homepage     = "https://github.com/ninjinkun/NJKWebViewProgress"
  s.authors      = { "ninjinkun" => "ninjin@mac.com" }
  s.source       = { :git => "https://github.com/ninjinkun/NJKWebViewProgress.git", :tag => "v#{s.version}" }
  s.platform     = :ios, '5.0'
  s.source_files = 'NJKWebViewProgress'
  s.requires_arc = true
end