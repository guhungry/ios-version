#
#  Be sure to run `pod spec lint WCVersion.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "WCVersion"
  s.version      = "0.0.6"
  s.summary      = "Simple version number compare in major(.minor)?(.patch)? format"
  s.description  = <<-DESC
Simple version number compare in major(.minor)?(.patch)? format

Supports compare using ==, !=, >, >=, < and <=
                   DESC
  s.homepage     = "https://github.com/guhungry/ios-version"

  s.license      = "MIT"
  s.author             = { "Woraphot Chokratanasombat" => "guhungry@gmail.com" }

  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/guhungry/ios-version.git", :tag => "#{s.version}" }
  s.source_files  = "WCVersion/**/*.swift"
  s.dependency "WCExtensions", '~> 0.0.5'

  s.swift_version = "4.2"
end
