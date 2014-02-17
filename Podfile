platform :ios,  '6.0'


pod 'TMGeneral',  		'~> 1.18.0'
pod 'UIKitCategoryAdditions_kang', '~> 0.1.0'

#pod "SparkInspector" 

#########################################
#pod 'GoogleAnalytics-iOS-SDK', '~> 3.0'
#pod 'ZXingObjC', 		'2.1.0'
#pod 'Facebook-iOS-SDK',         '~> 3.11.0'
pod 'NSLogger',   		'1.1'
#pod 'HCYoutubeParser',          '>=0.0.1'
#pod 'iCarousel_kang',           '1.7.5'
#pod 'SVPullToRefresh', 		'~> 0.4.1'
#pod 'RTLabel',			'~> 1.0'
#pod 'Parse-iOS-SDK', '~> 1.2.18'
#pod 'TestFlightSDK', '~> 2.0.2'
#pod 'JazzHands', '~> 0.0.3'
#pod 'DAKeyboardControl',        '~> 2.3.0'
#########################################


post_install do |installer_representation|
  installer_representation.project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['VALID_ARCHS'] = 'armv7'
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
    end
  end
end

