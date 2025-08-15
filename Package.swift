// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "DeeplinkSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "DeeplinkSDK",
            targets: ["DeeplinkSDK"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "DeeplinkSDK",
            url: "https://github.com/iAgentur/iagDynamicLinkSdk_ios/releases/download/0.1.2/DeeplinkSDK.xcframework.zip",
            checksum: "73387a715de08337608b8fbfafb2f0fd0709f4628c802b9deb2cd0b61b893e03"
        )
    ]
)