# LaTeX compiler:
LC = lualatex

# LaTeX flags:
LFLAGS = -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape
	# -synctex=1:
	# -interaction=nonstopmode
	# -file-line-error: print error messages in the form file:line:error which is similar to the way many compilers format them. 

# Bilbiography compiler:
BC = biber

# Bibliography flags:
BFLAGS =

# Edit program:
EC = gvim

# Editing flags:
ECFLAGS = -c ':set spell' #-c ':set spelllang=fr' 

# Name of the file without extension:
filename = main

#####################################################################################################################################
# Remove tex extension
filename_tex = $(addsuffix .tex,$(filename))
filename_pdf = $(addsuffix .pdf,$(filename))

all:
	$(LC) $(LFLAGS) $(filename_tex)

bib:
	$(LC) $(LFLAGS) $(filename_tex)
	$(BC) $(BFLAGS) $(filename)
	$(LC) $(LFLAGS) $(filename_tex)
	$(LC) $(LFLAGS) $(filename_tex)

read:
	evince $(filename_pdf) &

clean:
	rm -f ${filename}.{aux,auxlock,bbl,bbl-SAVE-ERROR,bcf,bcf-SAVE-ERROR,blg,dvi,fdb_latexmk,figlist,fls,makefile,mw,nav,out,pdf,ps,run.xml,snm,synctex.gz,toc}
	rm -f *.log
	rm -f figures/external/*

edit:
	$(EC) $(ECFLAGS) $(filename_tex)
