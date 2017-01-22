Pod::Spec.new do |s|
  s.name             = 'SwinjectAutoregistration'
  s.version          = '2.0.0'
  s.summary          = 'Autoregistration for Swinject'
  s.description      = <<-DESC
SwinjectAutoregistration is an extension of Swinject to automatically inject dependency into registered services.
                       DESC

  s.homepage         = 'https://github.com/Swinject/SwinjectAutoregistration'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'Swinject Contributors'
  s.source           = { :git => 'https://github.com/Swinject/SwinjectAutoregistration', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Sources/**/*'
  
  s.dependency 'Swinject', '~> 2.0.0-beta.2'
end
