# Tech Overview Poster - Makefile
# ================================

# Configuration
TEX = pdflatex
TEXFLAGS = -interaction=nonstopmode -halt-on-error
LATEXMK = latexmk
LATEXMKFLAGS = -pdf -pdflatex="$(TEX) $(TEXFLAGS)"

# Files
MAIN = TechOverviewPoster
PDF = $(MAIN).pdf
LOGO_SVGS = $(wildcard logos/*.svg)
LOGO_PDFS = $(LOGO_SVGS:.svg=.pdf)

# Default target
all: logos $(PDF)

# Convert SVG logos to PDF
logos: $(LOGO_PDFS)

logos/%.pdf: logos/%.svg
	@echo "Converting $< to $@..."
	@rsvg-convert -f pdf -o $@ $<

# Build PDF using pdflatex (simple, fast)
$(PDF): $(MAIN).tex logos/*.pdf
	$(TEX) $(TEXFLAGS) $(MAIN).tex
	$(TEX) $(TEXFLAGS) $(MAIN).tex

# Build using latexmk (handles dependencies automatically)
latexmk: $(MAIN).tex
	$(LATEXMK) $(LATEXMKFLAGS) $(MAIN).tex

# Quick single-pass compile (for drafts)
quick:
	$(TEX) $(TEXFLAGS) $(MAIN).tex

# View the PDF (opens with default viewer)
view: $(PDF)
	@if command -v xdg-open > /dev/null; then \
		xdg-open $(PDF); \
	elif command -v open > /dev/null; then \
		open $(PDF); \
	else \
		echo "No PDF viewer found. Open $(PDF) manually."; \
	fi

# Watch for changes and rebuild (requires latexmk)
watch:
	$(LATEXMK) -pvc $(LATEXMKFLAGS) $(MAIN).tex

# Clean auxiliary files
clean:
	rm -f *.aux *.log *.out *.toc *.fls *.fdb_latexmk *.synctex.gz

# Clean everything including PDF
distclean: clean
	rm -f $(PDF)

# Show help
help:
	@echo "Available targets:"
	@echo "  all       - Build the PDF (default)"
	@echo "  logos     - Convert all SVG logos to PDF"
	@echo "  quick     - Single-pass compile (fast, for drafts)"
	@echo "  latexmk   - Build using latexmk (handles refs)"
	@echo "  view      - Open the PDF"
	@echo "  watch     - Auto-rebuild on file changes"
	@echo "  clean     - Remove auxiliary files"
	@echo "  distclean - Remove all generated files"
	@echo "  help      - Show this help"

.PHONY: all logos quick latexmk view watch clean distclean help
