Pod::Spec.new do |s|

  s.name         = "GMYGestureLockView"
  s.version      = "1.0.0.0"
  s.summary      = "User Gesture lock&unlock View"
  s.homepage     = "https://github.com/778477/GestureLockView"
  s.screenshots  = "https://raw.githubusercontent.com/778477/GestureLockView/master/snapshot.png", 
		               "https://raw.githubusercontent.com/778477/GestureLockView/master/snapshot1.png"
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "778477" => "1032419360@qq.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "git@github.com:778477/GestureLockView.git", :tag => s.version}
  s.source_files  = "GMYGestureLockView/*.{h,m}"
  s.requires_arc = true
end