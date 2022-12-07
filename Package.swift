// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "euueuu",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.1.2"),
        .package(url: "https://github.com/christopherweems/unstandard.git", branch: "main"),
        
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
