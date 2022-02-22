library("dplyr")

sat_data <- read.csv("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-ErikOnsager/main/scores.csv?token=GHSAT0AAAAAABQLRLGJJP7QGPHDDPEVR4SMYQ4IHPQ")

sat_data <- sat_data %>% mutate(average_total_score = Average.Score..SAT.Math. + Average.Score..SAT.Reading. + Average.Score..SAT.Writing.)

sat_data$Percent.Tested <- gsub("%$", "", sat_data$Percent.Tested)
sat_data$Percent.Tested <- as.numeric(sat_data$Percent.Tested)
`Percent Tested` <- sat_data$Percent.Tested
`Average Score` <- sat_data$average_total_score

library(ggplot2)
ggplot() +
  geom_point(aes(x = `Percent Tested`, y = `Average Score`))

