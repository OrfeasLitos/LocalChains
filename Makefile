all: localchains.pdf

localchains.pdf: src/*
	if [ -e dot2tex ]; then rm -r dot2tex; fi
	mkdir dot2tex;
	export TEXINPUTS=.:./src//:; \
	pdflatex --shell-escape localchains.tex; \
	bibtex localchains.aux; \
	pdflatex --shell-escape localchains.tex; \
	pdflatex --shell-escape localchains.tex; \
	rm -rf localchains.aux localchains.log localchains.out localchains.bbl localchains.blg
	mv dot2tex/*.tex src/figures/;
	rm -r dot2tex

clean:
	rm -rf *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.pdf
