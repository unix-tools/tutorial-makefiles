# Regression analysis of two random vectors

# random data
set.seed(754321)
x <- rnorm(20)
y <- x + rnorm(20)

# regression line
reg <- lm(y ~ x)

# save objects in .RData (binary file)
save(x, y, reg, file = 'regression.RData')
