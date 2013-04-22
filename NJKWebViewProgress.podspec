Pod::Spec.new do |s|
  s.name         = "NJKWebViewProgress"
  s.version      = "0.1"
  s.license      = :type => 'MIT'
  s.summary      = "UIWebView progress"
  s.homepage     = "https://github.com/ninjinkun/NJKWebViewProgress"
  s.authors      = { "ninjinkun" => "ninjin@mac.com" }
  s.source       = { :git => "git@ghe.admin.h:hatena/ios-modules-HatenaAuth.git", :tag => "v#{s.version}" }
  s.platform     = :ios, '5.0'
  s.source_files = 'NJKWebViewProgress'
  s.requires_arc = true
end