# How to Compile the Book

## Prerequisites
- LaTeX installation with `pdflatex` and `bibtex`
- ImageMagick (for converting missing figures)

## Compilation Steps

1. **Fix missing PDF figures** (if needed):
   ```bash
   cd figs
   magick todd85.png todd85.pdf
   cd ..
   ```

2. **Compile the book**:
   ```bash
   pdflatex -interaction=nonstopmode book.tex
   bibtex book
   pdflatex -interaction=nonstopmode book.tex
   pdflatex -interaction=nonstopmode book.tex
   ```

The final PDF will be generated as `book.pdf`.

## Notes
- The `-interaction=nonstopmode` flag allows compilation to continue past non-fatal errors
- Multiple pdflatex runs are needed to resolve cross-references and citations
- Some warnings about overfull boxes are normal and don't affect the final output