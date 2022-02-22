library("dplyr")
library(ggplot2)

sat_data <- read.csv("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-ErikOnsager/main/scores.csv?token=GHSAT0AAAAAABQLRLGJJP7QGPHDDPEVR4SMYQ4IHPQ")

sat_data <- sat_data %>% mutate(average_total_score = Average.Score..SAT.Math. + Average.Score..SAT.Reading. + Average.Score..SAT.Writing.)

sat_data$Percent.White <- gsub("%$", "", sat_data$Percent.White)
sat_data$Percent.Tested <- gsub("%$", "", sat_data$Percent.Tested)
sat_data$Percent.White <- as.numeric(sat_data$Percent.White)
sat_data$Percent.Tested <- as.numeric(sat_data$Percent.Tested)

Percent_Tested <- sat_data$Percent.Tested
Percent_White <- sat_data$Percent.White
Average_Score <- sat_data$average_total_score

ggplot(data = sat_data,mapping = aes(x = Percent_White, y = Average_Score, fill=`Percent Tested`)) +
  geom_bar(stat = "identity", width = 0.75) +
  labs(x = "\n Percent of White Students", y = "Average Score \n", title = "Average SAT Score By White Students \n") +
  theme(plot.title = element_text(hjust = 0), 
        axis.title.x = element_text (color="black", size = 10),
        axis.title.y = element_text(color="black", size = 10))
