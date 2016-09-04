Pod::Spec.new do |s|
  s.name             = 'SwinjectAutoregistration'
  s.version          = '1.0.0-beta.1'
  s.summary          = 'Autoregistration for Swinject'
  s.description      = <<-DESC
SwinjectAutoregistration is an extension of Swinject to automatically inject dependency into registered services.
                       DESC

  s.homepage         = 'https://gitlab.ack.ee/Ackee/ACKSwinject'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'Swinject Contributors'
  s.source           = { :git => 'https://github.com/Swinject/SwinjectAutoregistration', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'SwinjectAutoregistration/Classes/**/*'
  
  s.dependency 'Swinject', '1.1.3'
end
