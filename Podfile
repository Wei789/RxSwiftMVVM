# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

target 'itunesDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'RxSwift', '6.5.0'
  pod 'RxCocoa', '6.5.0'
  pod 'RxDataSources'
  pod 'Moya/RxSwift', '~> 15.0'
  pod 'Swinject'
end

target 'itunesDemoTests' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'RxSwift', '6.5.0'
  pod 'RxCocoa', '6.5.0'
  pod 'RxDataSources'
  pod 'Moya/RxSwift', '~> 15.0'
  pod 'Swinject'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end
