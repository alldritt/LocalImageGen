// swift-tools-version: 6.0
import PackageDescription

// Local Stable Diffusion image generation, split out of LocalLLM. StableDiffusion lives in
// mlx-swift-examples, whose main still pins mlx-swift 0.31.x; kept here, that pin no longer
// holds text-only LocalLLM hosts back from newer mlx-swift / mlx-swift-lm releases. A host
// that uses both packages resolves to mlx-swift 0.31.x until mlx-swift-examples moves on.
let package = Package(
    name: "LocalImageGen",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .library(name: "LocalImageGen", targets: ["LocalImageGen"])
    ],
    dependencies: [
        // Post-split main is untagged; pin the revision that pairs with mlx-swift 0.31.x.
        .package(
            url: "https://github.com/ml-explore/mlx-swift-examples",
            revision: "378f2449c257788c5067b9f8b086731d76b39b33"
        ),
        .package(url: "https://github.com/ml-explore/mlx-swift", from: "0.31.3"),
        .package(url: "https://github.com/huggingface/swift-transformers", from: "1.3.0")
    ],
    targets: [
        .target(
            name: "LocalImageGen",
            dependencies: [
                .product(name: "MLX", package: "mlx-swift", condition: .when(platforms: [.macOS])),
                .product(name: "StableDiffusion", package: "mlx-swift-examples", condition: .when(platforms: [.macOS])),
                .product(name: "Hub", package: "swift-transformers", condition: .when(platforms: [.macOS]))
            ]
        )
    ]
)
