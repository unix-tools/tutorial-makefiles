# Scatterplot of Height and Weight


# read data set
sw <- read.csv('../../data/clean_data/starwars_clean.csv')


# open graphic device
pdf(file = '../../images/scatterplot.pdf', width = 7, height = 6)

# scatterplot of height and weight
plot(sw$height, sw$weight, las = 1, pch = 21, cex = 2,
     col = 'white', bg = '#5E99EC', lwd = 1,
     xlab = 'Height (in cms)', ylab = 'Weight (in kgs)')

# close device
dev.off()
