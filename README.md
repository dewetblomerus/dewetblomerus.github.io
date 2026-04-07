# My Personal Website
You can visit the site [here](https://dewetblomerus.com/)

It is built with Jekyll and hosted for free on GitHub Pages

## Local Development

```bash
asdf install ruby 3.3.4
bundle install
bundle exec jekyll serve
```

## Images

Keep original images in `originals/images/` and generate served assets into `assets/images/`.
The script always reads from `originals/images/`, never from the already-generated files in `assets/images/`.

Install the image tools:

```bash
sudo apt install imagemagick libavif-bin
```

Generate AVIF images from the originals:

```bash
bash scripts/optimize-images
```

Regenerate a single image at higher quality when needed:

```bash
PHOTO_MAX_EDGE=3200 AVIF_MIN=18 AVIF_MAX=26 bash scripts/optimize-images dewet-profile
```
