# Description: 
# Makefile example with several dependent targets.
# Creates an html report of a regression analysis in R

all: regression.html

regression.html: report.md regression-model.md scatterplot.png
	pandoc report.md regression-model.md -s -o regression.html

scatterplot.png: regression-plot.R regression.RData
	Rscript regression-plot.R

regression-model.md: regression-model.R regression.RData
	Rscript regression-model.R

regression.RData: regression-data.R
	Rscript regression-data.R
