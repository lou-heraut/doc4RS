VENV        = .python_env
PIP         = $(VENV)/bin/pip
MKDOCS      = $(VENV)/bin/mkdocs

.PHONY: install serve build pdf clean help

help:
	@echo ""
	@echo "  make install   installe toutes les dépendances"
	@echo "  make serve     lance le serveur local (hot reload)"
	@echo "  make build     build statique du site web"
	@echo "  make pdf       génère le PDF via pandoc"
	@echo "  make deploy    publie le site sur GitHub Pages"
	@echo "  make clean     supprime site/"
	@echo ""

install: $(VENV) check-pandoc

$(VENV):
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install \
		mkdocs \
		mkdocs-material \
		mkdocs-bibtex
	@echo ""
	@echo "Installation Python terminée."

check-pandoc:
	@which pandoc > /dev/null 2>&1 || \
		(echo "\npandoc n'est pas installé. Lancez :\n\n  sudo apt install pandoc texlive-xetex\n" && exit 1)
	@echo "pandoc trouvé : $$(pandoc --version | head -1)"

serve:
	$(MKDOCS) serve

build:
	$(MKDOCS) build

pdf:
	mkdir -p site
	pandoc docs/diffusion.md \
		--bibliography=docs/refs.bib \
		--csl=docs/apa.csl \
		--citeproc \
		--pdf-engine=xelatex \
		-V mainfont="DejaVu Serif" \
		-V monofont="DejaVu Sans Mono" \
		-o site/documentation.pdf
	@echo ""
	@echo "PDF généré : site/documentation.pdf"

deploy:
	$(MKDOCS) gh-deploy

clean:
	rm -rf site/
