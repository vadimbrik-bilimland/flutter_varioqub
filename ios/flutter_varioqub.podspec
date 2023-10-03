#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_varioqub.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_varioqub'
  s.version          = '0.0.1'
  s.summary          = 'Flutter плагин для сервиса A/B тестирования от Yandex Metrica - Varioqub'
  s.description      = <<-DESC
Flutter плагин для сервиса A/B тестирования от Yandex Metrica - Varioqub
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'Varioqub/MetricaAdapter', '~> 0.5'

s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
