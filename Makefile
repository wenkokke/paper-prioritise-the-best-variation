MAIN ?= priorities
SOURCES := $(shell find . -type f -and \( -name '*.tex' -or -name '*.bib' \))

default: build

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
	@open -a Skim $(MAIN).pdf

$(MAIN).pdf: $(SOURCES)
	@latexmk -pdf $(MAIN) -halt-on-error

