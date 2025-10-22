
Pod::Spec.new do |s|
  s.name             = 'XAIModulesLibs'
  s.version          = '0.1.0'
  s.summary          = 'A short description of XAIModulesLibs.'

    s.description      =

  s.homepage         = 'XAIModulesLibs'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhouzhi' => 'zhi.zhou@kumai-inc.com' }
  s.source           = { :git => 'XAIPackagesLibs' }


  s.dependency 'Masonry'
  s.dependency 'XAIMediator'
  s.dependency 'Bifrost'
end
