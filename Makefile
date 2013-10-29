all: html

# The presentation source goes into one file. Name it here.
FILENAME ?= index

# For HTML slideshows, Pandoc supports s5, slidy, slideous, dzslides,
# and revealjs
SLIDESHOW_BACKEND ?= slidy

# Add any CSS style overrides to the file referenced here
SLIDESHOW_CSS ?= css/slidy-override.css

# For PDF output, Pandoc currently supports only beamer
PDF_BACKEND ?= beamer


# Generate an HTML slideshow from the corresponding .md file, using
# the configured slideshow backend. Use the --standalone and
# --self-contained options for an HTML file that uses data URI and
# thus doesn't require any external resources.
%.html: %.md $(SLIDESHOW_CSS)
	pandoc --slide-level 2 --standalone --self-contained \
	  --from markdown --to $(SLIDESHOW_BACKEND) \
	  --css $(SLIDESHOW_CSS) \
	  $< -o $@

# Generate an PDF from the corresponding .md file, using Beamer.
%.pdf: %.md
	pandoc -f markdown -t $(PDF_BACKEND) $< -o $@ 

html: $(FILENAME).html

pdf: $(FILENAME).pdf

clean:
	rm -f $(FILENAME).html $(FILENAME).pdf

.PHONY: all html pdf clean
