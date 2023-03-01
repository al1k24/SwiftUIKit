// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SwiftUIKit",
            targets: ["SwiftUIKit"]
        )
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "SwiftUIKit",
            dependencies: []
        )
    ],
    swiftLanguageVersions: [.v5]
)
