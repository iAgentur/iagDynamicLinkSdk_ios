// swift-tools-version:5.9
import PackageDescription

let sdkName = "DeeplinkSDK"
let sdkStatic = "\(sdkName)-static"

let package = Package(
    name: "DeeplinkSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: sdkStatic,
            type: .static,
            targets: [sdkStatic]
        ),
    ],
    targets: [
        .binaryTarget(name: sdkName, path: "framework/static/\(sdkName).xcframework"),
        .target(
            name: sdkStatic,
            dependencies: [
                .target(name: sdkName),
            ],
            path: "framework/SPM",
            exclude: ["DeeplinkSDK.podspec"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)