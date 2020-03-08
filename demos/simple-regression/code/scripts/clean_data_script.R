# Clean Data

sw <- read.csv('../../data/raw_data/starwars.csv')

#sw <- read.csv('data/raw_data/starwars.csv')

# rows of specified individuals
indivs <- c(
  'Anakin Skywalker',
  'Padme Amidala',
  'Luke Skywalker',
  'Leia Skywalker',
  'Obi-Wan Kenobi',
  'Han Solo',
  'R2-D2',
  'C-3PO',
  'Yoda',
  'Chewbacca'
)
obs <- sw$name %in% indivs

# variables of interest
variables <- c('name', 'height', 'weight')

# subsetting data and expressed height in cms
sw_clean <- sw[obs,variables]
sw_clean$height <- sw_clean$height * 100

# clean data 
write.csv(sw_clean, 
          file = '../../data/clean_data/starwars_clean.csv',
          row.names = FALSE)
