# regression object
load('regression.RData')

# summary of 'reg' object saved to markdown file
sink(file = 'regression-model.md')
cat("```")
summary(reg)
cat("```\n")
sink()
