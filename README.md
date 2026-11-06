# LocalImageGen

Local text-to-image generation (SDXL Turbo, Stable Diffusion 2.1) via
[mlx-swift-examples](https://github.com/ml-explore/mlx-swift-examples)' StableDiffusion.
macOS only. Split out of [LocalLLM](../LocalLLM) so that package's text-only hosts aren't held
to the mlx-swift version StableDiffusion pins.

```swift
import LocalImageGen

let generator = LocalImageGenerator()
let png = try await generator.generate(prompt: "a lighthouse at dusk")
```

Weights download to `~/Library/Caches/models/<repo-id>/`, alongside LocalLLM's text models.
`unload()` frees them, so a host can keep only one large model resident at a time.
