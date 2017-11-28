all: localchains.pdf

localchains.pdf: src/*
	export TEXINPUTS=.:./src//:; \
	pdflatex localchains.tex; \
	bibtex localchains.aux; \
	pdflatex localchains.tex; \
	pdflatex localchains.tex; \
	rm -rf localchains.aux localchains.log localchains.out localchains.bbl localchains.blg

clean:
	rm -rf *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.pdf
