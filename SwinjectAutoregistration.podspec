Pod::Spec.new do |s|
  s.name             = 'SwinjectAutoregistration'
  s.version          = '2.1.0'
  s.summary          = 'Autoregistration for Swinject'
  s.description      = <<-DESC
SwinjectAutoregistration is an extension of Swinject that allows to automatically inject dependencies into registered services.
                       DESC

  s.homepage         = 'https://github.com/Swinject/SwinjectAutoregistration'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'Swinject Contributors'
  s.source           = { :git => 'https://github.com/Swinject/SwinjectAutoregistration.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  s.requires_arc = true

  s.source_files = 'Sources/**/*.{swift,h}'
  s.dependency 'Swinject', '~> 2.1'
end
