nolist.pdf : nolist.tex nolist.bib
	latexmk -pdf -halt-on-error -bibtex nolist

nolist.tex : nolist.nw nolist.pl
	~/lib/markup nolist.nw \
	    | ~/lib/emptydefn \
	    | ~/lib/noidx \
	    | ./nolist.pl > nolist.tex

nolist.pipeline : nolist.nw nolist.pl
	~/lib/markup nolist.nw \
	    | ~/lib/emptydefn \
	    | ~/lib/noidx > nolist.pipeline

	
nolist.pl : nolist.nw
	notangle -Rnolist.pl -filter emptydefn nolist.nw > nolist.pl
	chmod u+x nolist.pl
	notangle -Rsmnolist.pl -filter emptydefn nolist.nw > smnolist.pl
	notangle -Rtrnolist.pl -filter emptydefn nolist.nw > trnolist.pl

.PHONY : clean
clean :
	latexmk -C nolist
	-rm nolist.bbl
	-rm nolist.run.xml nolist.tex
	-rm trnolist.pl smnolist.pl nolist.pl
	-rm nolist.pipeline
