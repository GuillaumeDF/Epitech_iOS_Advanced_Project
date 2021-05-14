Pod::Spec.new do |s|
  s.name = '__TEMPLATE__'
  s.version = '0.1.0'
  s.summary = 'A short description of __TEMPLATE__.'

  s.description = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage = 'https://github.com/Dev-Guillaume/Epitech_iOS_Advanced_Project/tree/main/Flag/Frameworks/__TEMPLATE__'
  s.author = { 'Guillaume Djaider Fornari' => 'guillaume.djaider-forrnari@epitech.eu' }
  s.source = { :git => 'https://github.com/Dev-Guillaume/Epitech_iOS_Advanced_Project/tree/main/Flag/Frameworks/__TEMPLATE__.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = '__TEMPLATE__/Classes/**/*'
  
  s.resource_bundles = {
    '__TEMPLATE__' => ['__TEMPLATE__/Assets/*.png']
  }
  #s.dependency 'Core'
end
