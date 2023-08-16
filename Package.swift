// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyJSCompiler",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftyJSCompiler",
            targets: ["SwiftyJSCompiler"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftyJSCompiler",
            path: "Sources",
            resources: [.copy("Resources/babel.js"), .copy("Resources/parser.js"), .copy("Resources/esprima.js")]),
        .testTarget(
            name: "SwiftyJSCompilerTests",
            dependencies: ["SwiftyJSCompiler"]),
    ]
)
