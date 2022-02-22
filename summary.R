library("dplyr")

sat_data <- read.csv("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-ErikOnsager/main/scores.csv?token=GHSAT0AAAAAABQLRLGJJP7QGPHDDPEVR4SMYQ4IHPQ")

summary_info <- list()

sat_data <- sat_data %>% mutate(average_total_score = Average.Score..SAT.Math. + Average.Score..SAT.Reading. + Average.Score..SAT.Writing.)

summary_info$average_score <- mean(sat_data$average_total_score, na.rm = TRUE)

summary_info$median_score <- median(sat_data$average_total_score, na.rm = TRUE)

# removing the % from the column for percent white and black and changing values to numeric
sat_data$Percent.White <- gsub("%$", "", sat_data$Percent.White)
sat_data$Percent.Black <- gsub("%$", "", sat_data$Percent.Black)
sat_data$Percent.White <- as.numeric(sat_data$Percent.White)
sat_data$Percent.Black <- as.numeric(sat_data$Percent.Black)

summary_info$percent_white_of_max_tested <- sat_data %>% filter(Percent.Tested == max(Percent.Tested, na.rm = TRUE)) %>% pull(Percent.White)
summary_info$percent_black_of_max_tested <- sat_data %>% filter(Percent.Tested == max(Percent.Tested, na.rm = TRUE)) %>% pull(Percent.Black)

# Multiple schools had 0% tested, so the average of these schools is reported
summary_info$percent_white_of_min_tested <- mean(sat_data %>% filter(Percent.Tested == "0.0%") %>% pull(Percent.White))
summary_info$percent_black_of_min_tested <- mean(sat_data %>% filter(Percent.Tested == "0.0%") %>% pull(Percent.Black))

summary_info$average_score_of_max_enrollment <- sat_data %>% filter(Student.Enrollment == max(Student.Enrollment, na.rm = TRUE)) %>% pull(average_total_score)

#NA because none at the smallest school took the sat
summary_info$average_score_of_min_enrollment <- sat_data %>% filter(Student.Enrollment == min(Student.Enrollment, na.rm = TRUE)) %>% pull(average_total_score)


