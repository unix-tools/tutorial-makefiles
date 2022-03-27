# inputs
RMDS = $(wildcard *.Rmd)

# output html files
HTMLS = $(patsubst %.Rmd, %.html, $(RMDS))
GITS = $(patsubst %.Rmd,%.md,$(wildcard *.Rmd))

.PHONY: clean

#all: $(HTMLS)
all: $(GITS)

# Run every Rmd file
%.md: %.Rmd
	Rscript -e "library(rmarkdown); render('$<')"


clean:
	rm -rf $(HTMLS)
