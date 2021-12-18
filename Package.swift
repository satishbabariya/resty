// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Resty",
    products: [
        .library(name: "Resty", targets: ["Resty"]),
    ],
    targets: [
        .target(name: "Resty", dependencies: []),
        .testTarget(name: "RestyTests", dependencies: ["Resty"]),
    ],
    swiftLanguageVersions: [.v5]
)
