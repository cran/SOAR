pdf: SOAR.Rnw refs.bib
	R CMD Sweave SOAR.Rnw
	pdflatex SOAR
	bibtex SOAR
	pdflatex SOAR
	pdflatex SOAR
	rm SOAR.log SOAR.out SOAR.aux SOAR.bbl SOAR.blg SOAR.toc SOAR.tex
	rm -rf .R_Cache
