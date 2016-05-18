# phony targets
.PHONY: all clean

# all
all: output.html output.tex output.txt


# from markdown to html
output.html: input.md
	pandoc input.md -s -o output.html

# from markdown to latex
output.tex: input.md
	pandoc input.md -s -o output.tex

# from markdown to reStructuredText
output.txt: input.md
	pandoc input.md -t rst -s -o output.txt

# remove output files
clean:
	rm -f output.*
