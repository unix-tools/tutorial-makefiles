set.seed(98765)
x <- sample(1:5, size = 100, replace = TRUE)

png("plots/04-histogram.png")
hist(x, col = "tomato")
dev.off()
