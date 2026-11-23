# DPhil thesis: Counting with Limited Supervision (Oxford, 2024)

- `MAH_Thesis_FINAL_onesided.pdf`: the final PDF (169 pages, built July 2024 with pdfTeX 1.40.24 / TeX Live 2022).
- `source/`: LaTeX that rebuilds that PDF. It's unpacked, not zipped, so every file stays under GitHub's 100 MB limit.

## Build

    cd source
    latexmk -pdf thesis.tex

`thesis.tex` is the main file; the bibliography uses BibTeX with `unsrtnat`. On Overleaf,
set the main document to `thesis.tex`. Beyond a basic TeX Live, the build needs
`algorithmicx`, `newtx`, `bbding`, `babel-greek`, `babel-latin`, `greek-fontenc`, `cbfonts`
and `cm-super` (all included in a full TeX Live install).

## Verification (2026-11-23)

Built with TeX Live 2023 and compared with the PDF above:
- 169/169 pages, and identical text on every page.
- 160 pages are pixel-identical. The other 9 differ by sub-pixel glyph rendering (math
  braces, check marks, the snowflake symbol), which comes from TeX Live 2023 vs 2022.
  Nothing moves or reflows.

## How this source was made

`MAH_Thesis.zip` holds the final corrected source, but its comments had been stripped.
That stripping left whitespace-only lines where comment lines used to be, and LaTeX reads
those as paragraph breaks. As a result, several FSC-133 figures (e.g. Fig 3.3) laid out
differently, figures moved on pp. ~53–73, and a paragraph on p.124 reflowed.

To fix it:
1. Start from the zip (all 825 files, including every post-viva correction).
2. For the 60 `.tex`/`.bib` files that differ from the submitted version (GitHub
   `mahobley/MAH_Thesis` @ b963326, Jan 2024), put back the original comments and
   whitespace. Every real wording change from the zip is kept. Check: ignoring comments
   and blank lines, the result is identical to the zip.
3. One functional change in `preamble.tex`: `\newcommand{\ie}`/`\newcommand{\eg}` became
   `\providecommand`. `ociamthesis.cls` already defines both, so the original lines raised
   "Command already defined" errors (Overleaf skips past those). The PDF output is
   unchanged, but now the build finishes with no errors.
4. Then all comments were removed from the `.tex` and `.bib` files, without the bug in the
   zip: whole-line comments are deleted outright (no blank line left behind), and trailing
   comments keep a bare `%` so lines still join the same way. The result builds
   pixel-identical on all 169 pages to the version with comments. `ociamthesis.cls` keeps
   its comments (template documentation, as in the zip).
