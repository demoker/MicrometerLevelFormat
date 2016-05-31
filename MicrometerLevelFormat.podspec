Pod::Spec.new do |s|
    s.name         = 'MicrometerLevelFormat
'
    s.version      = '1.0.0'
    s.summary      = 'micrometer level fromat (千分位)'
    s.homepage     = 'https://github.com/demoker/MicrometerLevelFormat'
    s.license      = 'MIT'
    s.authors      = {'demoker' => 'mdk132@qq.com'}
    s.platform     = :ios, '7.0'
    s.source       = {:git => 'https://github.com/demoker/MicrometerLevelFormat.git', :tag => s.version}
    s.source_files = 'class/*.{h,m}'
    s.requires_arc = true
end
