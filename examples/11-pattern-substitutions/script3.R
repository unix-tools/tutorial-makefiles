set.seed(98765)
x <- sample(1:5, size = 100, replace = TRUE)

freqs <- table(x)

png("plots/03-dotchart.png")
dotchart(freqs, las = 1, col = "tomato", pch = 19)
dev.off()
