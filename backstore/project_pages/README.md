# Project pages (first-author papers)

Copies of the `gh-pages` branches from the ActiveVisionLab GitHub. On 2026-11-23 the
files were byte-identical to the live sites.

| Folder | Live URL | Source repo @ commit |
|---|---|---|
| `ABC123/` | https://abc123.active.vision | ActiveVisionLab/ABC123 `gh-pages` @ b39fe20 (2024-07-12) |
| `MCAC/` | https://mcac.active.vision | ActiveVisionLab/MCAC `gh-pages` @ f5f1dd2 (2024-05-22) |
| `LearningToCountAnything/` | https://countinganything.active.vision | ActiveVisionLab/LearningToCountAnything `gh-pages` @ 1c53280 (2024-07-12) |

All images, CSS and sub-pages (`MCAC/MCAC_examples.html`) are local. Each `CNAME` file is
the GitHub Pages custom-domain setting. It does nothing inside a subfolder of another site.

## External references

- **LearningToCountAnything** loads Bootstrap 4.5.2 from `stackpath.bootstrapcdn.com`.
  A copy is saved at `LearningToCountAnything/external/bootstrap-4.5.2.min.css`. To stop
  depending on the CDN, change the `<link>` href in `index.html` to
  `external/bootstrap-4.5.2.min.css`. The page also references `style.css`, which has
  never existed (it 404s on the live site too).
- **MCAC** links to the dataset at
  `https://www.robots.ox.ac.uk/~lav/Datasets/MCAC/MCAC.zip`. That file is 21 GB and was
  not downloaded.
- Links to arXiv papers, GitHub repos, Google Scholar and co-author homepages are left
  as external links. Your own papers' arXiv sources and PDFs are in `../paper_latex/`.
