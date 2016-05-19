# Simple makefile that uses two variables

# variables
IN = input.md
OUT = report

# phony targets
.PHONY: all clean

# all
all: $(OUT).html $(OUT).tex $(OUT).txt

# from markdown to html
$(OUT).html: $(IN)
	pandoc $(IN) -s -o $(OUT).html

# from markdown to latex
$(OUT).tex: $(IN)
	pandoc $(IN) -s -o $(OUT).tex

# from markdown to reStructuredText
$(OUT).txt: $(IN)
	pandoc $(IN) -t rst -s -o $(OUT).txt

# clean outputs
clean:
	rm -rf $(OUT).*
