
Pod::Spec.new do |s|
s.name         = 'SJScrollEntriesView'
s.version      = '1.0.2'
s.summary      = 'scrollEntriesView.'
s.description  = 'https://github.com/changsanjiang/SJScrollEntriesView/blob/master/README.md'
s.homepage     = 'https://github.com/changsanjiang/SJScrollEntriesView'
s.license      = { :type => 'MIT', :file => 'LICENSE.md' }
s.author       = { 'SanJiang' => 'changsanjiang@gmail.com' }
s.platform     = :ios, '8.0'
s.source       = { :git => 'https://github.com/changsanjiang/SJScrollEntriesView.git', :tag => "v#{s.version}" }
s.source_files  = 'SJScrollEntriesView/*.{h,m}'
s.framework  = 'UIKit'
s.requires_arc = true
s.dependency 'Masonry'
end
