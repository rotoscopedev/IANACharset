// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "IANACharset",
  defaultLocalization: "en",
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "IANACharset",
      targets: ["IANACharset"]),
  ],
  dependencies: [
    .package(url: "https://github.com/Quick/Nimble.git", from: "9.0.0"),
    .package(url: "https://github.com/swiftcsv/SwiftCSV.git", from: "0.6.1"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "IANACharset",
      dependencies: [
        "SwiftCSV"
      ],
      resources: [
        .process("Database"),
      ]),
    .testTarget(
      name: "IANACharsetTests",
      dependencies: [
        "IANACharset",
        "Nimble"
      ]),
  ]
)
