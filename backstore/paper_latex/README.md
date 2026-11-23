# arXiv LaTeX sources

Every paper in `pub.html` that has an arXiv link. Each folder has `source/` (the arXiv
e-print, unmodified) and `arxiv_<id>.pdf` (the PDF arXiv serves for that version).
Downloaded 2026-11-23 (latest version of each).

| Folder | arXiv | Main file | Compiles | Matches arXiv PDF |
|---|---|---|---|---|
| `LearningToCountAnything_CVPR2023` | 2205.10203v2 | `main_AAAI_arixv.tex` | yes | 18/18 pages, same text (abstract wraps 1 line differently) |
| `DMS_arXiv2023` | 2305.18492v1 | `main.tex` | yes | 11/11 pages, identical text |
| `ABC123_MCAC_ECCV2024` | 2309.04820v2 | `main.tex` | yes | 16/16 pages, pixel-identical |
| `EngineBench_IJER2025` | 2406.03325v1 | `neurips_2024.tex` | yes | 28/28 pages, pixel-identical |
| `SAVeD_WACV2026` | 2504.00161v2 | `main.tex` | yes | 20/20 pages, one cross-ref says "Appendix" not "Sec." (see note) |
| `SingleViewSeafloor_CVPRW2026` | 2605.24195v1 | `main.tex` | yes | 17/17 pages, pixel-identical |
| `GenerativeModelsAsSimulators_arXiv2026` | 2610.12847v1 | `main.tex` | yes | 33 pages on arXiv / 34 locally (see note) |

The MCAC entry in `pub.html` links to the same arXiv paper as ABC123 (2309.04820), so it
has one folder.

## Build

    latexmk -pdf <main file>

Folders that ship a `.bbl` use it as-is (that's what arXiv does). The other two
(SingleViewSeafloor, GenerativeModelsAsSimulators) need BibTeX, which latexmk runs.

Packages you need beyond a basic TeX Live install: `ieeetran`, `algorithms`, `bbding`,
`siunitx`, and `cm-super` (without cm-super, ABC123 falls back to bitmap fonts).

## Note on TeX Live versions

arXiv built the 2025–26 papers with TeX Live 2025. With TeX Live 2023, `cleveref` labels
appendix sections "appendix X" instead of "section X". In GenerativeModelsAsSimulators
the longer words push two lines onto an extra page (34 vs 33). Adding
`\crefname{appendix}{section}{sections}` gives a pixel-identical 33-page PDF, which
confirms the source is complete. The sources here are left unmodified.
