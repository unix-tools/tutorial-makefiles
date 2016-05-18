# inputs
RMDS = $(wildcard *.Rmd)

# output html files
HTMLS = $(patsubst %.Rmd, %.html, $(RMDS))

.PHONY: clean


all: $(HTMLS)

# Run every Rmd file
%.html: %.Rmd
	Rscript -e "library(rmarkdown); render('$<')"


clean:
	rm -rf $(HTMLS)
