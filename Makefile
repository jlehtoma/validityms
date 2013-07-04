TITLE = A sample paper
AUTHOR = Joona Lehtomäki
GITHUB = https://github.com/jlehtoma/validityms
FILENAME = validity_ms
SOURCE = README.md

BUILDDIR = $(CURDIR)/pandoc
BIBLIOGRAPHY = $(BUILDDIR)/validity_ms.bib
# CSL style for HTML
CSL=$(BUILDDIR)/plos.csl
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

all: pdf latex odt docx

pdf:
	@echo $(info Converting to pdf...)
	@$(PANDOC) -H $(BUILDDIR)/margins.sty --template $(BUILDDIR)/templates/default.tex --bibliography $(BIBLIOGRAPHY) --csl $(CSL) $(FILENAME).md -o $(BUILDDIR)/$(FILENAME).pdf --latex-engine=xelatex

latex:
	@echo $(info Converting to latex...)
	@$(PANDOC) -H $(BUILDDIR)/margins.sty --template $(BUILDDIR)/templates/default.tex --bibliography $(BIBLIOGRAPHY) --csl $(CSL) $(FILENAME).md -o $(BUILDDIR)/$(FILENAME).tex --latex-engine=xelatex

odt:
	@echo $(info Converting to odt...)
	@$(PANDOC) -H $(BUILDDIR)/margins.sty --template $(BUILDDIR)/templates/default.tex --bibliography $(BIBLIOGRAPHY) --csl $(CSL) $(FILENAME).md -o $(BUILDDIR)/$(FILENAME).odt --latex-engine=xelatex

docx:
	@echo $(info Converting to docx...)
	@$(PANDOC) -H $(BUILDDIR)/margins.sty --template $(BUILDDIR)/templates/default.tex --bibliography $(BIBLIOGRAPHY) --csl $(CSL) $(FILENAME).md -o $(BUILDDIR)/$(FILENAME).docx --latex-engine=xelatex

html:
	@$(PANDOC) $(FILENAME).md -o $(BUILDDIR)/$(FILENAME).html --template $(HTML_TEMPLATE) --css $(HTML_CSS) --smart $(BIBARGS) -t html5

clean:
	@cd $(BUILDDIR); rm -f *.tex *.aux *.log *.out *.bbl *.blg *.bcf *.run.xml *.bak tmp.* *.tmp *.docx *.odt *.pdf