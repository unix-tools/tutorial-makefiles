mds = $(wildcard *.md)

output.html: $(mds)
	echo input files: $(mds)
	pandoc $(mds) -s -o output.html
