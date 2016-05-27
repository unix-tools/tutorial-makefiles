set.seed(98765)
x <- sample(1:5, size = 100, replace = TRUE)

freqs <- table(x)

png("plots/01-barchart.png")
barplot(freqs, las = 1, col = "tomato")
dev.off()

