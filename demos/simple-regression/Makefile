
PAPER = paper

.PHONY:
	clean

all: paper/$(PAPER).pdf


paper/$(PAPER).pdf: paper/paper.Rnw paper/sections/*.Rnw images/*.pdf
	cd paper && Rscript -e "library(knitr); knit2pdf('$(PAPER).Rnw')"


images/*.pdf: code/scripts/*.R
	cd code/scripts; Rscript histograms_script.R
	cd code/scripts; Rscript scatterplot_script.R


clean:
	@echo Clean up
	cd paper; rm -f *.{aux,log,tex,pdf}


# ===============================================================

#all: paper/paper.pdf

#paper/paper.pdf: paper/paper.Rnw images/histograms.pdf images/scatterplot.pdf
#	cd paper && Rscript -e "library(knitr); knit2pdf('paper.Rnw')"

#images/histograms.pdf: code/scripts/histograms_script.R
#	cd code/scripts && Rscript histograms_script.R

#images/scatterplot.pdf: code/scripts/scatterplot_script.R
#	cd code/scripts && Rscript scatterplot_script.R



# ================================================================

#FIGDIR= ./images
#IMAGES= $(wildcard $(FIGDIR)/*.pdf)
#SCRIPTSDIR= ./code/scripts
#SCRIPTS= $(wildcard $(SCRIPTSDIR)/*.R)

#paper.pdf: $(IMAGES)
#	cd paper && Rscript -e "library(knitr); knit2pdf('paper.Rnw')"

# run every image script file
#$(IMAGES): $(SCRIPTS) 
#	Rscript $<
