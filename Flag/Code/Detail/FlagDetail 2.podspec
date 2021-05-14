Pod::Spec.new do |s|
  s.name = 'FlagDetail'
  s.version = '0.1.0'
  s.summary = 'A short description of FlagDetail.'

  s.description = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage = 'https://github.com/Xodia/FlagDetail'
  s.author = { 'Morgan Collino' => 'morgan1.collino@epitech.eu' }
  s.source = { :git => 'https://github.com/Xodia/FlagDetail.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = 'FlagDetail/Classes/**/*'
  
  s.resource_bundles = {
    'FlagDetail' => ['FlagDetail/Assets/*.png']
  }
end
