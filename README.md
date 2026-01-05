# Tech Overview Poster

A comprehensive one-page overview of major technology products and services from Microsoft, Apple, Google, Amazon, and other providers across various categories.

## Preview

![Tech Overview Poster](showcase.png)

The poster provides a side-by-side comparison of products across categories including:
- Operating Systems (PC, Mobile)
- Email & Calendar
- Office Suites
- Video Conferencing
- Cloud Storage
- Web Browsers
- Photos & Media
- Streaming Services (Music & Video)
- Messaging Apps
- AI Assistants

## Building

### Requirements
- `pdflatex` (TeX Live or similar)
- `rsvg-convert` (for SVG to PDF conversion)
- `make`

### Quick Build
```bash
make quick
```

### Full Build (with logo conversion)
```bash
make all
```

### Other Commands
- `make view` - Open the generated PDF
- `make watch` - Auto-rebuild on file changes
- `make clean` - Remove auxiliary files
- `make distclean` - Remove all generated files

## Structure
- `TechOverviewPoster.tex` - Main LaTeX source file
- `Makefile` - Build configuration
- `logos/` - Product and company logos (SVG, PDF, PNG)

## License
All product names and logos are trademarks of their respective owners.

---
*Stand: Januar 2026*
