###########################################################################
##	
## File Name:		Makefile				
##											
## Description:		Makefile for the theme example
##
## Author:			Hannes Bartle																				
## 					DHBW Ravensburg Campus Friedrichshafen		
##					September 2016											
##
###########################################################################
.SILENT:
## Main document
MAINFILE = dhbw_theme_example

# Build Ordner
BUILDDIR = build/
# Latex-Files Ordner
EXAMPLE = example/




# Commands
TEX = pdflatex  
TEXFLAGS =-file-line-error -interaction=batchmode -synctex=1 -output-directory=$(BUILDDIR)
DEL = rm -rf 
ECHO = echo -e 
ECHOCOLOR = \033[1;32m
ECHONC = \033[0m
MOVE = mv
MKDIR	= mkdir
VIEWPDF = firefox
PARSELOG = grep --color -E ".*:[0-9]*:.*|Warning:|Error:" $(BUILDDIR)$(MAINFILE).log





.PHONY: all 

all: pdf1 pdf2
	@$(MOVE) $(BUILDDIR)$(MAINFILE).pdf $(EXAMPLE)

.PHONY: pdf
pdf: pdf1
	
pdf1:
	@$(ECHO) "$(ECHOCOLOR)""\\n======================================================================="
	@$(ECHO) "Build PDF..."
	@$(ECHO) "=======================================================================""$(ECHONC)"
	test -d $(BUILDDIR) || mkdir $(BUILDDIR)
	
	$(TEX) $(TEXFLAGS) $(EXAMPLE)$(MAINFILE).tex 
	@$(ECHO) "$(ECHOCOLOR)""\\n======================================================================="
	@$(ECHO) "Done!!"
	@$(ECHO) "=======================================================================""$(ECHONC)"

pdf2:
	@$(ECHO) "$(ECHOCOLOR)""\\n======================================================================="
	@$(ECHO) "Build PDF..."
	@$(ECHO) "=======================================================================""$(ECHONC)"
	$(TEX) $(TEXFLAGS) $(EXAMPLE)$(MAINFILE).tex 
	@$(ECHO) "$(ECHOCOLOR)""\\n======================================================================="
	@$(ECHO) "Done!!"
	@$(ECHO) "=======================================================================""$(ECHONC)"

	

	
	
# Clean Working Directory
mrproper:
	@$(ECHO) "$(ECHOCOLOR)""\\n======================================================================="
	@$(ECHO) "Clean Working Directory...""$(ECHONC)"
	$(DEL) $(BUILDDIR)*
	$(DEL) $(EXAMPLE)*.bak
	$(DEL) $(EXAMPLE)*.~	
	$(DEL) $(MAINFILE).pdf
	@$(ECHO) "$(ECHOCOLOR)""Done!"
	@$(ECHO) "=======================================================================""$(ECHONC)"
	
# View PDF document
view: viewpdf

viewpdf:
	@$(ECHO) "$(ECHOCOLOR)""======================================================================="
	@$(ECHO) "View PDF..."
	@$(ECHO) "=======================================================================""$(ECHONC)"
	@$(VIEWPDF) $(EXAMPLE)$(MAINFILE).pdf &
	
	

# View Warning/Error Messages
viewlog:
	@$(ECHO) "$(ECHOCOLOR)""======================================================================="
	@$(ECHO) "Warnings:\\n"
	@$(PARSELOG)
	@$(ECHO) "\\n=======================================================================""$(ECHONC)"



 
