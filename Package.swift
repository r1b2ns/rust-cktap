// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// Update tag and checksum when publishing a new Swift binary release.
let tag = "v0.2.2"
let checksum = "f8d5a5761a8a2fc806c90c30317ad1b348fcfe2c2f963b2a0bc97097b1d3098f"
let url = "https://github.com/bitcoindevkit/rust-cktap/releases/download/\(tag)/cktapFFI.xcframework.zip"

let package = Package(
    name: "rust-cktap",
    platforms: [
        .macOS(.v12),
        .iOS("18.0"),
    ],
    products: [
        .library(
            name: "CKTap",
            targets: ["cktapFFI", "CKTap"]
        ),
    ],
    targets: [
        .target(
            name: "CKTap",
            dependencies: ["cktapFFI"],
            path: "./cktap-swift/Sources"
        ),
        .binaryTarget(
            name: "cktapFFI",
            url: url,
            checksum: checksum
        ),
    ]
)
