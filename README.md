# DHBW Beamer Theme

This is a pretty beamer theme in the style of a DHBW presentation.
It is based on jacksbeamertheme by JacknJo (https://github.com/JacknJo/jacksbeamertheme), credits belong to him.

I created a color palette to match the red-grey-black DHBW logo and added the possibility to add a company logo.


# Requirements
The theme was successfully tested with TexLive2016 and Miktex2.9.
Please raise an issue if there are any problems with your setup.

To build the example you can use the provided Makefile, in which case you need to have GNU Make installed.


# HowTo
Clone the repository to your location by using:

    git clone https://github.com/JacknJo/jacksbeamertheme.git

To use the theme you have to copy all .sty files and the dhbw logo into your working directory or your local beamer theme repository.

To build the example, simply run:

	make 

in the cloned repository

# Images
## Titlepage
![alt text](images/titlepage.PNG?raw=true "Titlepage")

## An example frame
![alt text](images/frame.PNG?raw=true "Example Frame")


