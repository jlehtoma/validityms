TITLE = Assessing the suitability of forest inventories for basis of spatial conservation prioritization
AUTHOR = Joona Lehtomäki
GITHUB = https://github.com/jlehtoma/validityms
FILENAME = validity_ms
SOURCE = README.md

BUILDDIR = $(CURDIR)/pandoc/build
TEMPLATEDIR = $(CURDIR)/pandoc/templates
BIBLIOGRAPHYDIR = $(CURDIR)/pandoc/bibliography
BIBLIOGRAPHY = $(BIBLIOGRAPHYDIR)/validity_ms.bib
# CSL style for HTML
CSL=$(BIBLIOGRAPHYDIR)/plos.csl
# biblatex style for LaTeX
BIBSTYLE=authoryear

ifneq ($(BIBLIOGRAPHY),)
	BIBARGS = --bibliography=$(BIBLIOGRAPHY)
	ifneq ($(CSL),)
		BIBARGS = --bibliography=$(BIBLIOGRAPHY) --csl=$(CSL)
	endif
	
	BIBLATEX = --biblatex
	
	ifneq ($(BIBSTYLE),)
		BIBLATEX = --biblatex -V bibstyle:$(BIBSTYLE)
	endif
endif

########################################################################

PANDOC = $(shell which pandoc)
ifeq ($(PANDOC),)
PANDOC = $(error please install pandoc)
endif

XELATEX = $(shell which xelatex)
ifeq ($(XELATEX),)
XELATEX = $(error please install xelatex)
endif

BIBER = $(shell which biber)
ifeq ($(BIBER),)
BIBER = $(error please install biber)
endif

PYTHON = $(shell which python)
ifeq ($(PYTHON),)
PYTHON = $(error please install python)
endif

########################################################################


GIT_TAG = $(shell git describe --abbrev=1)
TAG = $(strip $(subst .,_,$(GIT_TAG)))


ifeq ($(DATE),)
	DATE = $(REVDATE)
endif

# which template to use
TEMPLATE=default

# create HTML paper
HTML_CSS = $(TEMPLATEDIR)/$(TEMPLATE).css
HTML_TEMPLATE = $(TEMPLATEDIR)/$(TEMPLATE).html

all: pdf

preprocess:
	@echo $(info Preprocessing md file...)
	@$(PYTHON) preprocessor.py

bibtex:
	@echo $(info Copying BibTex file...)
	@cp /home/jlehtoma/Dropbox/Documents/Mendeley/BibTex/validity_ms.bib $(BIBLIOGRAPHYDIR) 

pdf: latex
	@echo $(info Converting to pdf...)	
	@$(PANDOC) -H $(TEMPLATEDIR)/margins.sty $(BUILDDIR)/$(FILENAME).tex \
	-o $(BUILDDIR)/$(FILENAME)_$(TAG).pdf --latex-engine=xelatex

latex: preprocess bibtex

	@echo $(info Copying image files to build dir...)	
	@cp -r figs $(BUILDDIR)

	@echo $(info Converting individual files to latex...)
	@$(PANDOC) $(BUILDDIR)/$(FILENAME)_front_matter_prep.md \
	-o $(BUILDDIR)/$(FILENAME)_front_matter.tex --latex-engine=xelatex
	@$(PANDOC) $(FILENAME)_abstract.md -o $(BUILDDIR)/$(FILENAME)_abstract.tex \
	--latex-engine=xelatex
	@$(PANDOC) $(FILENAME)_tables.md -t latex -o $(BUILDDIR)/$(FILENAME)_tables.tex 
	@$(PANDOC) $(FILENAME)_figures.md -o $(BUILDDIR)/$(FILENAME)_figures.tex --latex-engine=xelatex
	@$(PANDOC) $(FILENAME)_suppl.md -o $(BUILDDIR)/$(FILENAME)_suppl.tex --latex-engine=xelatex
	@$(PANDOC) glossary.md -o $(BUILDDIR)/$(FILENAME)_glossary.tex --latex-engine=xelatex

	@echo $(info Compiling final latex...)
	@$(PANDOC) -H $(TEMPLATEDIR)/margins.sty --template $(TEMPLATEDIR)/default.tex \
	--bibliography $(BIBLIOGRAPHY) --csl $(CSL) $(BUILDDIR)/$(FILENAME)_prep.md \
	-o $(BUILDDIR)/$(FILENAME).tex \
	--latex-engine=xelatex \
	--include-before-body=$(BUILDDIR)/$(FILENAME)_front_matter.tex \
	--include-before-body=$(BUILDDIR)/$(FILENAME)_abstract.tex \
	--include-after-body=$(BUILDDIR)/$(FILENAME)_tables.tex \
	--include-after-body=$(BUILDDIR)/$(FILENAME)_figures.tex \
	--include-after-body=$(BUILDDIR)/$(FILENAME)_suppl.tex \
	--include-after-body=$(BUILDDIR)/$(FILENAME)_glossary.tex

odt: latex
	@echo $(info Converting to odt...)
	@$(PANDOC) -H $(TEMPLATEDIR)/margins.sty --template $(TEMPLATEDIR)/default.tex \
	--bibliography $(BIBLIOGRAPHY) --csl $(CSL) $(BUILDDIR)/$(FILENAME).tex -o \
	$(BUILDDIR)/$(FILENAME).odt --latex-engine=xelatex

docx: latex
	@echo $(info Converting to docx...)
	@$(PANDOC) -H $(TEMPLATEDIR)/margins.sty --template $(TEMPLATEDIR)/default.tex \
	--bibliography $(BIBLIOGRAPHY) --csl $(CSL) $(BUILDDIR)/$(FILENAME).tex \
	-o $(BUILDDIR)/$(FILENAME)_$(TAG).docx --latex-engine=xelatex

html: latex
	@$(PANDOC) $(BUILDDIR)/$(FILENAME).tex -o $(BUILDDIR)/$(FILENAME)_$(TAG).html \
	--template $(HTML_TEMPLATE) --css $(HTML_CSS) --smart $(BIBARGS) -t html5

clean:
	@cd $(BUILDDIR); rm -f *.tex *.aux *.log *.out *.bbl *.blg *.bcf *.run.xml *.bak tmp.* *.tmp *.docx *.odt *.pdf *.html bibliography *.md; rm -Rf figs