Pod::Spec.new do |s|
  s.name = 'DeeplinkSDK'
  s.version = '0.1.2'
  s.summary = 'DeeplinkSDK for iOS'
  s.description = 'DeeplinkSDK for iOS'

  s.homepage = 'https://github.com/iAgentur/iagDynamicLinkSdk_ios'
  s.license = { :type => 'internal', :text => 'Copyright © 2025 iAgentur AG. All rights reserved.' }
  s.author = { 'iAgentur AG' => 'info@iagentur.ch' }
  s.source = { :git => 'git@github.com:iAgentur/iagDynamicLinkSdk_ios.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '14.0'
  s.swift_version = '5.9'

  s.vendored_framework = "DeeplinkSDK.xcframework"
end
