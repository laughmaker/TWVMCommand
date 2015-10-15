Pod::Spec.new do |s|

  s.name         = "TWVMCommand"
  s.version      = "1.0.1"
  s.summary      = "MVVMM中的ViewModel简单实现类"
  s.homepage     = "https://github.com/laughmaker/TWVMCommand"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "hezhendong" => "wskrdfeai@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/laughmaker/TWVMCommand.git", :tag => "1.0.1" }
  s.source_files = "TWVMCommand/*"
  s.dependency  'KVOController'

end
