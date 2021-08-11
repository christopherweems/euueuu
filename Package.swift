// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "euueuu",
    platforms: [.macOS(.v10_15),
                .iOS(.v13),
                .tvOS(.v13),
                .watchOS(.v6)],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMajor(from: "0.3.1")),
        .package(url: "https://github.com/christopherweems/unstandard", .upToNextMajor(from: "0.0.6")),
    ],
    targets: [
        .executableTarget(
            name: "euueuu",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "unstandard", package: "unstandard"),
            ]),
        .testTarget(
            name: "euueuuTests",
            dependencies: ["euueuu"]),
    ]
)
