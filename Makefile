RM = rm -f

all: pdf

both: dvi pdf

dvi: thesis.dvi
pdf: thesis.pdf abstract.pdf

thesis.dvi: clean
	latex  thesis
	bibtex thesis
	latex  thesis
	latex  thesis
	dvips -o thesis.ps thesis.dvi
	mv *.dvi Ko_PHDThesis.dvi

abstract.pdf: clean
	pdflatex abstract
	mv abstract.pdf Ko_PHDAbstract.pdf

thesis.pdf: clean
	pdflatex thesis
	bibtex   thesis
	pdflatex thesis
	pdflatex thesis
	mv thesis.pdf Ko_PHDThesis.pdf

appendix.dvi: appendix.tex preamble.tex 
	latex appendix.tex
	latex appendix.tex

view:
	evince Ko_PHDThesis.pdf
#	xpdf thesis.pdf
#xpdf Ko_PHDThesis.pdf

clean:
	$(RM) *.ps
	$(RM) *.toc
	$(RM) *.lot
	$(RM) *.lof
	$(RM) *.log 
	$(RM) *.aux 
	$(RM) *.blg
	$(RM) *.bbl 
	$(RM) *.dvi 
	$(RM) tex/*.aux
	$(RM) tex/*.log 
