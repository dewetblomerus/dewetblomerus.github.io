# Source Images

This directory stores the original image files used to generate the optimized web assets in `assets/images/`.

Intent:

- Keep the highest-quality source images in the repo.
- Do not serve these files directly from the site.
- Regenerate web-ready AVIF files whenever image quality or size needs to change.

The generated images are created with:

```bash
bash scripts/optimize-images
```

To regenerate a single image at a larger size or higher quality:

```bash
PHOTO_MAX_EDGE=3200 AVIF_MIN=18 AVIF_MAX=26 bash scripts/optimize-images dewet-profile
```
