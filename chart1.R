library("dplyr")

sat_data <- read.csv("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-ErikOnsager/main/scores.csv?token=GHSAT0AAAAAABQLRLGJJP7QGPHDDPEVR4SMYQ4IHPQ")

sat_data <- sat_data %>% mutate(average_total_score = Average.Score..SAT.Math. + Average.Score..SAT.Reading. + Average.Score..SAT.Writing.)

sat_data$Percent.Tested <- gsub("%$", "", sat_data$Percent.Tested)
sat_data$Percent.Tested <- as.numeric(sat_data$Percent.Tested)
Percent_Tested <- sat_data$Percent.Tested
Average_Score <- sat_data$average_total_score

library(ggplot2)
ggplot() +
  geom_point(aes(x = Percent_Tested, y = Average_Score)) +
  labs(x = "% of Students Tested", y = "Average Score", title = "Average SAT Score vs % of Students Tested between 2014 - 2015 in NYC")

