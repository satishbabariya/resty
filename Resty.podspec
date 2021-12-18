Pod::Spec.new do |s|
    s.name = 'Resty'
    s.version = '1.0.0'
    s.license = { :type => "MIT", :file => "LICENSE" }
    s.summary = 'HTTP Networking Library with Async/Await and Codable.'
    s.homepage = 'https://github.com/satishbabariya/resty'
    s.authors = { "Satish Babariya" => "satish.babariya@gmail.com" }
    s.source = { :git => 'https://github.com/satishbabariya/resty.git', :tag => s.version }
    s.ios.deployment_target = '11.0'
    s.osx.deployment_target = '10.13'
    s.swift_version = '5.0'
    s.source_files = 'Sources/Resty/*.swift'
    s.frameworks = 'CFNetwork'
end
