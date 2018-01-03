# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

# Disable Code Coverage for Pods projects
post_install do |installer_representation|
  installer_representation.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
          config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
      end
  end
end

target 'ifaker' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ifaker

  target 'ifakerTests' do
    inherit! :search_paths
    use_frameworks!
    pod 'Nimble', '~> 7.0.3'
    pod 'Quick'    
    pod 'Log'
  end

end
