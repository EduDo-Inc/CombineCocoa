// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "ExternalDependencies",
  platforms: [
    .iOS(.v10)
  ],
  products: [
    .library(
      name: "CombineCocoaDependency",
      targets: ["CombineCocoaDependency"]
    ),
  ],
  dependencies: [
    .package(path: "../../")
  ],
  targets: [
    .target(
      name: "CombineCocoaDependency",
      dependencies: [
        .product(
          name: "CombineCocoa",
          package: "CombineCocoa"
        )
      ]
    )
  ]
)
