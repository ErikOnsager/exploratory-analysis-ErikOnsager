library("dplyr")
library(ggplot2)

sat_data <- read.csv("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-ErikOnsager/main/scores.csv?token=GHSAT0AAAAAABQLRLGJJP7QGPHDDPEVR4SMYQ4IHPQ")

sat_data <- sat_data %>% mutate(average_total_score = Average.Score..SAT.Math. + Average.Score..SAT.Reading. + Average.Score..SAT.Writing.)

Manhattan_data <- sat_data %>% group_by(City) %>% filter(City == "Manhattan")
Brooklyn_data <- sat_data %>% group_by(City) %>% filter(City == "Brooklyn")

Manhattan <- Manhattan_data$average_total_score
Brooklyn <- Brooklyn_data$average_total_score

hist(Manhattan, col=rgb(1,0,0,0.5), breaks = 13, main = "Manhattan vs. Brooklyn", xlab = "Average SAT Score")
hist(Brooklyn, col=rgb(0,0,1,0.5), add=T)
legend(x = "topright", legend = c("Manhattan", "Brooklyn"), fill = c(rgb(1,0,0,0.5), rgb(0,0,1,0.5)))
box()
