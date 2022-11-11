Pod::Spec.new do |spec|
  spec.name             = 'ZenUIKit'
  spec.version          = '2.0.22'
  spec.swift_version    = '5.7'
  spec.summary          = 'ZenUIKit is a collection of views, extensions and functions for UIKit framework.'
  spec.description      = <<-DESC
ZenUIKit is a collection of convenient and concise extensions, views and functions for UIKit framework..
                       DESC
  spec.homepage         = 'https://github.com/roland19deschain/ZenUIKit'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Alexey Roik' => 'roland19deschain@gmail.com' }
  spec.source           = { :git => 'https://github.com/roland19deschain/ZenUIKit.git', :tag => spec.version }
  spec.requires_arc     = true
  spec.ios.deployment_target = '13.0'
  spec.source_files     = 'Sources/**/*{swift}'
  spec.dependency 'ZenSwift'
  spec.dependency 'ZenCoreGraphics'
end
