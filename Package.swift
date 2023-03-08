// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StepSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "StepSDK",targets: ["StepSDK"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/tryterra/TerraiOS.git", from : "1.3.4")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        
        .target(
            name: "StepSDK",
            dependencies: ["TerraiOS"], path: "Sources",
            resources: [
                .process("StepsMedia.xcassets"),
                .process("onboarding.storyboard")]),
        
        
//        .testTarget(
//            name: "StepSDKTests",
//            dependencies: ["StepSDK"]),
        
//
//            .binaryTarget(
//                name: "StepSDK",
//                path: "StepSDK.xcframework"),
    ]
)
