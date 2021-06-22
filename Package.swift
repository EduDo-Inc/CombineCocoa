// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "CombineCocoa",
  platforms: [.iOS(.v10), .macOS(.v10_15)],
  products: [
    .library(
      name: "CombineCocoa",
      type: .static,
      targets: ["CombineCocoa"]
    )
  ],
  dependencies: [],
  targets: [
    .target(
      name: "CombineCocoa",
      dependencies: [
        .target(name: "CombineCocoaInterception"),
        .target(name: "Runtime"),
      ]
    ),
    .target(
      name: "CombineCocoaInterception",
      dependencies: [
        .target(name: "Runtime")
      ]
    ),
    .target(name: "Runtime"),
  ]
)
