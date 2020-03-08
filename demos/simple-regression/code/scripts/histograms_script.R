# Histograms of Height and Weight


# read data set
sw <- read.csv('../../data/clean_data/starwars_clean.csv')


# open graphic device
pdf(file = '../../images/histograms.pdf', width = 8, height = 4)
# figure settings
op <- par(mfrow = c(1,2))
# histogram of height
hist(sw$height, las = 1, col = '#5E99EC', border = '#385b8d', 
     main = 'Histogram of Height',
     xlab = 'Height (in cms)')

# histogram of weight
hist(sw$weight, las = 1, col = '#FBB448', border = '#af7d32', 
     main = 'Histogram of Weight',
     xlab = 'Weight (in kgs)')

# close device
par(op)
dev.off()
