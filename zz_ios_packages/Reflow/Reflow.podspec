Pod::Spec.new do |s|
  s.name         = "Reflow"
  s.version      = "1.0.0"
  s.summary      = "Reflow"
  s.description  = <<-DESC
                  遵循flux单向数据流的概念，参考redux，objc类似的实现
                  DESC
  s.homepage     = "https://github.com/youzan/Bifrost/wikis/home"
  s.license      = 'MIT'
  s.author       = { "JackieYang" => "yangke@youzan.com" }
  s.source       = { :git => "https://github.com/youzan/Bifrost.git", :tag => s.version.to_s }
  s.source_files = ['Reflow/**/*','Reflow/*','Reflow/**/**/*']
  s.ios.deployment_target = "10.0"
end
