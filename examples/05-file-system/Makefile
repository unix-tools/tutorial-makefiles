# Description: 
# Creates an html document from several dependencies in various subdirectories

all: R-project.html

R-project.html: sections/01-intro.md sections/02-environment.md sections/03-logo.md
	cd sections; pandoc *.md -s -o R-project.html
	cd sections; mv R-project.html ../
