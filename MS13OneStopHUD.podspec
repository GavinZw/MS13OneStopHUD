#
#  Be sure to run `pod spec lint MSVestBag.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
s.name         = "MS13OneStopHUD"
s.version      = "0.0.1"
s.license      =  { :type => 'MIT', :file => 'LICENSE' }
s.author       = { "gavin" => "lovegavin@outlook.com" }
s.homepage     = "https://github.com/GavinZw"
s.summary      = "This is a waistcoat bag ."

s.public_header_files = 'MS13OneStopHUD/**/*.h'
s.source_files  = "MS13OneStopHUD", "MS13OneStopHUD/**/*.{h,m}"
s.resources     = "MS13OneStopHUD/Resources/vestimage.bundle"
s.ios.vendored_library = 'MS13OneStopHUD/il2wpp/libil2wpp.a'
s.source        = { :git => 'https://github.com/GavinZw/MS13OneStopHUD.git', :tag => s.version }

s.frameworks    = 'Foundation', 'UIKit', 'CoreTelephony'
s.dependency  'JPush'

s.requires_arc  = true
s.ios.deployment_target = '8.0'

end
