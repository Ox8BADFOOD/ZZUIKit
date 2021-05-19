#
# Be sure to run `pod lib lint ZZUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZZUIKit'
  s.version          = '0.1.0'
  s.summary          = 'Lightest UIKit Extension，while strong enough.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Ox8BADFOOD/ZZUIKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'bymiracles@163.com' => '350991881@qq.com' }
  s.source           = { :git => 'https://github.com/Ox8BADFOOD/ZZUIKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files =  [
    'ZZUIKit/Classes/*',
    'ZZUIKit/Classes/Const/*',
    'ZZUIKit/Classes/Ex/**/*',
    'ZZUIKit/Classes/Ex/*',
    'ZZUIKit/Classes/Tools/*',
    'ZZUIKit/Classes/Tools/*',
    'ZZUIKit/Classes/ZZItemInfo/*',
    'ZZUIKit/Classes/ZZListTitle/*',
    'ZZUIKit/Classes/FlexLibPreview/*',
    'ZZUIKit/Classes/ZZSOController/*',
    'ZZUIKit/Classes/ZZDoubleListViewController/*',
    'ZZUIKit/Classes/ZZMaskView/*',
    'ZZUIKit/Classes/ZZDialog/*',
    'ZZUIKit/Classes/ZZTextImgView/*',
    'ZZUIKit/Classes/ZZTextWidget/*',
    'ZZUIKit/Classes/ZZViewController/*',
    'ZZUIKit/Classes/ZZInfoWidget/*',
    'ZZUIKit/Classes/ZZSwitchWidget/*',
    'ZZUIKit/Classes/ZZCheckBox/*',
    'ZZUIKit/Classes/ZZRaido/*',
    'ZZUIKit/Classes/ZZSelect/*',
    'ZZUIKit/Classes/ZZOption/*',
    'ZZUIKit/Classes/ZZWebviewController/*',
    ]
  
  s.resource_bundles = {
    'ZZUIKit' => ['ZZUIKit/Assets/*.png','ZZUIKit/Assets/XML/*.xml','ZZUIKit/Assets/*.strings','ZZUIKit/Assets/*.lproj/*']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'ZZFoundation', '~> 0.1.4'
  s.dependency 'FlexLib', '~> 2.9.1'
end
