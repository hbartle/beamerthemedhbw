#########################################################################################
##
## Description:		This Makefile builds the provided example.
##					It is tested with GNU Make, Miktex 2.9 and TexLive2016 on 64-bit.
##
##					The beamerthemedhbw is based on jacksbeamertheme
##					(https://github.com/JacknJo/jacksbeamertheme)
##
## Author:			Hannes Bartle																				
## 					DHBW Ravensburg Campus Friedrichshafen		
##					September 2016	
## 
## The beamerthemedhbw is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## The beamerthemedhbw is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with the beamerthemedhbw.  If not, see <http://www.gnu.org/licenses/>.
## 
## 
#########################################################################################
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



 
