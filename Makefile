nolist.pdf : nolist.tex nolist.bib
	latexmk -pdf -halt-on-error -bibtex nolist

nolist.tex : nolist.nw nolist.pl
	/usr/lib/noweb/markup nolist.nw \
	    | /usr/lib/noweb/emptydefn \
	    | ./nolist.pl > nolist.tex

nolist.pl : nolist.nw
	notangle -Rnolist.pl nolist.nw > nolist.pl
	chmod u+x nolist.pl
	notangle -Rsmnolist.pl nolist.nw > smnolist.pl
	notangle -Rtrnolist.pl nolist.nw > trnolist.pl

.PHONY : clean
clean :
	latexmk -C nolist
	-rm nolist.bbl
	-rm nolist.run.xml nolist.tex
	-rm trnolist.pl smnolist.pl nolist.pl
