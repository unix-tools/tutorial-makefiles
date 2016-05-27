set.seed(98765)
x <- sample(1:5, size = 100, replace = TRUE)

freqs <- table(x)

png("plots/02-piechart.png")
pie(freqs)
dev.off()
