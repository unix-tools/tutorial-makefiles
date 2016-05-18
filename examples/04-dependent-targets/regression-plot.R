# load data
load("regression.RData")

# scatter diagram with fitted regression line
png('scatterplot.png')
plot(x, y, las = 1, pch = 19, col = "#555555")
abline(reg, col = "#0000DD70", lwd = 4)
dev.off()
