library("dplyr")
library(ggplot2)

sat_data <- read.csv("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-ErikOnsager/main/scores.csv?token=GHSAT0AAAAAABQLRLGJJP7QGPHDDPEVR4SMYQ4IHPQ")

sat_data <- sat_data %>% mutate(average_total_score = Average.Score..SAT.Math. + Average.Score..SAT.Reading. + Average.Score..SAT.Writing.)
sat_data <- sat_data %>% mutate(each_race_tested = Percent_White + Percent_Asian + Percent_Black + Percent_Hispanic)
each_race_tested

sat_data$Percent.Tested <- gsub("%$", "", sat_data$Percent.Tested)
sat_data$Percent.Tested <- as.numeric(sat_data$Percent.Tested)

Race_Tested <- sat_data$each_race_tested
Percent_Tested <- sat_data$Percent.Tested
Average_Score <- sat_data$average_total_score

ggplot(data = sat_data,mapping = aes(x = Race_Tested, y = Average_Score)) +
  geom_bar(stat = "identity", width = 0.75) +
  coord_flip() +
  labs(x = "\n Race", y = "Average Score \n", title = "Average SAT Score By Race \n") +
  theme(plot.title = element_text(hjust = 0), 
        axis.title.x = element_text (color="black", size = 10),
        axis.title.y = element_text(color="black", size = 10))
