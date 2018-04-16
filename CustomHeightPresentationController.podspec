Pod::Spec.new do |s|
  s.name             = 'CustomHeightPresentationController'
  s.version          = '0.1.0'
  s.summary          = "A presentation wrapper to show a controller that doesn't fill the full screen."

  s.description      = <<-DESC
A tiny library (one UIViewController) that makes presenting modal screens much easier. It mimics the presentation animation and feel of UIActionSheet but leaves all design to the developer. A custom controller is animated up from the bottom of the screen and the view "underneath" is grayed out. Tapping anywhere on the presenting view will dismiss the presented controller.
                       DESC

  s.homepage         = 'https://github.com/joemasilotti/CustomHeightPresentationController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Joe Masilotti' => 'joe@masilotti.com' }
  s.source           = { :git => 'https://github.com/joemasilotti/CustomHeightPresentationController.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/joemasilotti'

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.0'
  s.source_files = 'CustomHeightPresentationController/Classes/**/*'
  s.frameworks = 'UIKit'
end
