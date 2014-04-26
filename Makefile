TITLE = A sample paper
AUTHOR = Joona Lehtomäki
GITHUB = https://github.com/jlehtoma/validityms
FILENAME = validity_ms
SOURCE = README.md

BUILDDIR = $(CURDIR)/pandoc
BIBLIOGRAPHY = $(BUILDDIR)/validity_ms.bib
# CSL style for HTML
CSL=$(BUILDDIR)/conservation-biology.csl
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

########################################################################

REVHASH = $(shell git log -1 --format="%H" -- $(SOURCE))
REVDATE = $(shell git log -1 --format="%ai" -- $(SOURCE))
REVSHRT = $(shell git log -1 --format="%h" -- $(SOURCE))

ifeq ($(DATE),)
	DATE = $(REVDATE)
endif

ifneq ($(GITHUB),)
	REVLINK = $(GITHUB)commit/$(REVHASH)
	GIT_ATOM_FEED = $(GITHUB)commits/master.atom
endif


# which template to use
TEMPLATE=default

# create HTML paper
HTML_CSS = $(BUILDDIR)/templates/$(TEMPLATE).css
HTML_TEMPLATE = $(BUILDDIR)/templates/$(TEMPLATE).html

all: pdf

bibtex:
	@echo $(info Copying BibTex file...)
	@cp /home/jlehtoma/Dropbox/Documents/Mendeley/BibTex/validity_ms.bib $(BUILDDIR) 

pdf: latex
	@echo $(info Converting to pdf...)	
	@$(PANDOC) -H $(BUILDDIR)/margins.sty \
	--bibliography $(BIBLIOGRAPHY) --csl $(CSL) $(BUILDDIR)/$(FILENAME).tex \
	-o $(BUILDDIR)/$(FILENAME).pdf --latex-engine=xelatex

latex: bibtex
	@echo $(info Converting to latex...)
	@$(PANDOC) $(FILENAME)_front_matter.md -o $(BUILDDIR)/$(FILENAME)_front_matter.tex --latex-engine=xelatex
	@$(PANDOC) $(FILENAME)_abstract.md -o $(BUILDDIR)/$(FILENAME)_abstract.tex --latex-engine=xelatex
	@$(PANDOC) $(FILENAME)_tables.md -t latex+pipe_tables -o $(BUILDDIR)/$(FILENAME)_tables.tex 
	@$(PANDOC) $(FILENAME)_figures.md -o $(BUILDDIR)/$(FILENAME)_figures.tex --latex-engine=xelatex
	@$(PANDOC) $(FILENAME)_suppl.md -o $(BUILDDIR)/$(FILENAME)_suppl.tex --latex-engine=xelatex

	@$(PANDOC) -H $(BUILDDIR)/margins.sty --template $(BUILDDIR)/templates/default.tex \
	--bibliography $(BIBLIOGRAPHY) --csl $(CSL) $(FILENAME).md -o $(BUILDDIR)/$(FILENAME).tex \
	--latex-engine=xelatex \
	--include-before-body=$(BUILDDIR)/$(FILENAME)_front_matter.tex \
	--include-before-body=$(BUILDDIR)/$(FILENAME)_abstract.tex \
	--include-after-body=$(BUILDDIR)/$(FILENAME)_tables.tex \
	--include-after-body=$(BUILDDIR)/$(FILENAME)_figures.tex \
	--include-after-body=$(BUILDDIR)/$(FILENAME)_suppl.tex

odt: latex
	@echo $(info Converting to odt...)
	@$(PANDOC) -H $(BUILDDIR)/margins.sty --template $(BUILDDIR)/templates/default.tex \
	--bibliography $(BIBLIOGRAPHY) --csl $(CSL) $(BUILDDIR)/$(FILENAME).tex -o \
	$(BUILDDIR)/$(FILENAME).odt --latex-engine=xelatex

docx: latex
	@echo $(info Converting to docx...)
	@$(PANDOC) -H $(BUILDDIR)/margins.sty --template $(BUILDDIR)/templates/default.tex \
	--bibliography $(BIBLIOGRAPHY) --csl $(CSL) $(BUILDDIR)/$(FILENAME).tex \
	-o $(BUILDDIR)/$(FILENAME).docx --latex-engine=xelatex

html: latex
	@$(PANDOC) $(BUILDDIR)/$(FILENAME).tex -o $(BUILDDIR)/$(FILENAME).html \
	--template $(HTML_TEMPLATE) --css $(HTML_CSS) --smart $(BIBARGS) -t html5

clean:
	@cd $(BUILDDIR); rm -f *.tex *.aux *.log *.out *.bbl *.blg *.bcf *.run.xml *.bak tmp.* *.tmp *.docx *.odt *.pdf