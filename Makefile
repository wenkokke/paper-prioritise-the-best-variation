MAIN ?= priorities
VIEW ?= open -a Skim
SOURCES := $(shell find . -type f -and \( -name '*.tex' -or -name '*.bib' \))

default: clean build view watch

.PHONY: build
build: $(MAIN).pdf

.PHONY: watch
watch:
	@fswatch -o $(SOURCES) | xargs -n1 -I{} make

.PHONY: clean
clean:
	@latexmk -C $(MAIN)

.PHONY: view
view:
	@$(VIEW) $(MAIN).pdf

$(MAIN).pdf: $(SOURCES)
	@latexmk -pdf $(MAIN) -halt-on-error
