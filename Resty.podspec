Pod::Spec.new do |s|
    s.name = 'Resty'
    s.version = '1.0.0'
    s.license = { :type => "MIT", :file => "LICENSE" }
    s.summary = 'HTTP Networking Library with Async/Await and Codable.'
    s.homepage = 'https://github.com/ssatishbabariya/resty'
    s.authors = { "Satish Babariya" => "satish.babariya@gmail.com" }
    s.source = { :git => 'https://github.com/satishbabariya/resty.git', :tag => s.version }
    s.ios.deployment_target = '10.0'
    s.osx.deployment_target = '10.12'
    s.tvos.deployment_target = '10.0'
    s.watchos.deployment_target = '3.0'
    s.swift_version = '5.0'
    s.source_files = 'Sources/Resty/*.swift'
    s.frameworks = 'CFNetwork'
end
