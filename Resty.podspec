Pod::Spec.new do |s|
    s.name = 'Resty'
    s.version = '0.0.1'
    s.license = { :type => "MIT", :file => "LICENSE" }
    s.summary = 'A Swift library for Contacts framework.'
    s.homepage = 'https://github.com/swift-resty/resty'
    s.authors = { "Satish Babariya" => "satish.babariya@gmail.com" }
    s.source = { :git => 'https://github.com/swift-resty/resty.git', :tag => s.version }
    s.ios.deployment_target = '10.0'
    s.osx.deployment_target = '10.12'
    s.tvos.deployment_target = '10.0'
    s.watchos.deployment_target = '3.0'
    s.swift_version = '5.0'
    s.source_files = 'Sources/Resty/*.swift'
    s.frameworks = 'CFNetwork'
end
