Pod::Spec.new do |s|
  s.name         = "NJKWebViewProgress"
  s.version      = "0.1.7a"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.summary      = "UIWebView progress interface."
  s.homepage     = "https://github.com/victorwon/NJKWebViewProgress"
  s.authors      = { "ninjinkun" => "ninjin@mac.com" }
  s.source       = { :git => "https://github.com/victorwon/NJKWebViewProgress.git" }
  s.platform     = :ios, '4.3'
  s.source_files = 'NJKWebViewProgress'
  s.requires_arc = true
end
