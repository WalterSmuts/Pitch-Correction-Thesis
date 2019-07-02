ThesisName = Walter\ Smuts\ -\ Pitch\ Correction\ of\ Digital\ Audio

$(ThesisName).pdf: $(ThesisName).tex
	pdflatex $(ThesisName)
	bibtex $(ThesisName)
	pdflatex $(ThesisName)
	pdflatex $(ThesisName)

clean:
	rm *.pdf *.aux *.out *.log
