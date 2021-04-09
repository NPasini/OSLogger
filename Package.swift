// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OSLogger",
    platforms: [
        .iOS(.v10),
    ],
    products: [
        .library(
            name: "OSLogger",
            targets: ["OSLogger"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "8.0.1")),
    ],
    targets: [
        .target(
            name: "OSLogger",
            dependencies: []),
        .testTarget(
            name: "OSLoggerTests",
            dependencies: ["OSLogger", "Quick", "Nimble"]),
    ]
)
