# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def shared
  pod 'RxSwift'
  pod 'RxCocoa'
#  pod 'Realm'
  pod 'RealmSwift'
  pod 'UICircularProgressRing'
  pod 'Kingfisher'
end

use_modular_headers!

target 'TestApp' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  # use_frameworks!

  # Pods for TestApp
  shared

end

target 'TestAppTests' do
  # inherit! :search_paths
  # Pods for testing
  shared
end

target 'TestAppUITests' do
  #inherit! :search_paths
  # Pods for testing
  shared
end
