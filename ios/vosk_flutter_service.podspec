#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint vosk_flutter_service.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'vosk_flutter_service'
  s.version          = '0.0.1'
  s.summary          = 'Flutter plugin for offline speech recognition using Vosk.'
  s.description      = <<-DESC
Flutter plugin for offline speech recognition using the Vosk speech recognition toolkit.
                       DESC
  s.homepage         = 'https://github.com/dhia-bechattaoui/vosk_flutter_service'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Alpha Cephei' => 'contact@bechattaoui.dev' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'
  s.swift_version = '5.0'

  # Link to the pre-compiled Vosk framework.
  # Note: The user (or CI) must provide LibVosk.xcframework in the ios/Frameworks directory.
  # We might need to add a script to download it if it's not vendored.
  # For now, we assume it is vendored or manually placed.
  s.vendored_frameworks = 'Frameworks/libvosk.xcframework'
  
  # Ensure the framework is preserved
  s.preserve_paths = 'Frameworks/libvosk.xcframework'
  
  s.pod_target_xcconfig = { 
    'DEFINES_MODULE' => 'YES', 
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'
  }
end
