
Pod::Spec.new do |s|
  s.name         = "Safeframe"
  s.version      = "1.1.1"
  s.summary      = "A safe text boxes"
  s.homepage     = "https://github.com/Bruce-7/SafeframeDemo"
  s.license      = "MIT"
  s.author       = { "HeDong" => "57008939@qq.com" }
  s.source       = { :git => "https://github.com/Bruce-7/SafeframeDemo.git", :tag => s.version }
  s.platform     = :ios, "7.0"
  s.requires_arc = true

  s.resource     = "SafeframeDemo/Safeframe/Safeframe.bundle"
  s.source_files = "SafeframeDemo/Safeframe/*.{h,m}"

end