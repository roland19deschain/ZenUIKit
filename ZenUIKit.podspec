Pod::Spec.new do |s|
  s.name             = 'ZenUIKit'
  s.version          = '1.10.2'
  s.swift_version    = '5.0'
  s.summary          = 'ZenUIKit is a collection of views, extensions and functions for UIKit framework.'
  s.description      = <<-DESC
ZenUIKit is a collection of convenient and concise extensions, views and functions for UIKit framework..
                       DESC
  s.homepage         = 'https://github.com/roland19deschain/ZenUIKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alexey Roik' => 'roland19deschain@gmail.com' }
  s.source           = { :git => 'https://github.com/roland19deschain/ZenUIKit.git', :tag => s.version }
  s.requires_arc     = true
  s.ios.deployment_target = '11.0'
  s.source_files     = 'ZenUIKit/**/*{swift}'
end
