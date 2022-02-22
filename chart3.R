library("dplyr")
library(ggplot2)

sat_data <- read.csv("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-ErikOnsager/main/scores.csv?token=GHSAT0AAAAAABQLRLGJJP7QGPHDDPEVR4SMYQ4IHPQ")

sat_data <- sat_data %>% mutate(average_total_score = Average.Score..SAT.Math. + Average.Score..SAT.Reading. + Average.Score..SAT.Writing.)

sat_data$Student.Enrollment <- gsub("%$", "", sat_data$Student.Enrollment)
sat_data$Student.Enrollment <- as.numeric(sat_data$Student.Enrollment)
Student_Enrollment <- sat_data$Student.Enrollment
Average_Score <- sat_data$average_total_score


ggplot(data = sat_data, mapping = aes(x = Student_Enrollment, y = Average_Score)) +
  geom_line() +
  labs(x = "\n Student Enrollment", y = "Average Score \n", title = "Average SAT Score per Student Enrollment between 2014 - 2015 in NYC \n") +
  theme(plot.title = element_text(hjust = 0), 
        axis.title.x = element_text(color="black", size = 10),
        axis.title.y = element_text(color="black", size = 10))
