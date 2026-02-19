// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// Update tag and checksum when publishing a new Swift binary release.
let tag = "v0.2.1"
let checksum = "092e2d3fff08747cb8a3a7ca17107a2ff98497c72cec40ebf263bfeb0569ac19"
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
