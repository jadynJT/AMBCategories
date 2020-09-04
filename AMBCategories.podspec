Pod::Spec.new do |s|

  s.name         = "AMBCategories"
  s.version      = "1.0.0"
  s.summary      = "阿米巴网络技术科技有限公司内部基础类别库。"
  s.homepage     = "https://gitee.com/ardura/ambcategories"
  s.license      = "MIT"
  s.author       = { "ardura" => "r695331437@163.com" }
  s.source       = { :git => "https://gitee.com/ardura/ambcategories.git", :tag => "1.0.0" }

  s.source_files  = "AMBCategories/AMBCategories.h"

  s.subspec 'Foudation' do |ss|
    ss.source_files  = "AMBCategories/Foudation/**/*.{h,m}"
  end

  s.subspec 'UIKit' do |ss|
    ss.dependency "AMBCategories/Foudation"
    ss.source_files  = "AMBCategories/UIKit/**/*.{h,m}"
  end

  s.requires_arc  = true
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"

end