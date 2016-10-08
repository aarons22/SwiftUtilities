#
# Be sure to run `pod lib lint SwiftUtilities.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SwiftUtilities"
  s.version          = "0.1.5"
  s.summary          = "A toolbelt of utilities for Swift."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = "Boilerplate code that I've been copying from project to project"

  s.homepage         = "https://github.com/aarons22/SwiftUtilities"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Aaron Sapp" => "sapp.aaron@gmail.com" }
  s.source           = { :git => "https://github.com/aarons22/SwiftUtilities.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/aaronsapp'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'SwiftUtilities' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
    s.dependency 'HanekeSwift', '~>0.10.1'
end
