Pod::Spec.new do |s|

  s.name         = "WeLib03"
  s.version      = "0.0.5"
  s.summary      = "Test summary"
  s.description  = <<-DESC
                  这里测试信息, 应该要比summary长一些, 这样差不多了.
                  换一行. 多一些.
                   DESC
  s.homepage     = "https://github.com/willbin/WeLib03"
  s.license      = "MIT"
  s.author       = { "Will Wei" => "weiyoubin@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/willbin/WeLib03.git", :tag => "#{s.version}" }
  s.source_files  = "ReadingImgs/*.*"
  s.requires_arc = true

end