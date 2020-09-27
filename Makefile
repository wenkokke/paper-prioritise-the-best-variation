SOURCES := $(shell find . -type f -and \( -name '*.tex' -or -name '*.bib' \))

default: build

.PHONY: build
build: priorities.pdf

.PHONY: watch
watch:
	@fswatch -o $(SOURCES) | xargs -n1 -I{} make

.PHONY: clean
clean:
	@latexmk -C priorities

priorities.pdf: $(SOURCES)
	@latexmk -pdf priorities -halt-on-error

