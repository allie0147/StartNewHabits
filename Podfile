# Uncomment the next line to define a global platform for your project

def rx
  pod 'RxSwift', '6.2.0'
  pod 'RxCocoa', '6.2.0'
  pod 'RxDataSources'
end

def swiftLint
  pod 'SwiftLint'
end

target 'GoodHabits' do
  platform :ios, '13.0'
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for GoodHabits
  rx
  swiftLint

end

target 'GoodHabits WatchKit App' do
  platform :watchos, '4.0'
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  `$(inherited)`
  # Pods for GoodHabits WatchKit App
  
end

target 'GoodHabits WatchKit Extension' do
  platform :watchos, '4.0'
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  `$(inherited)`

  # Pods for GoodHabits WatchKit Extension

end
