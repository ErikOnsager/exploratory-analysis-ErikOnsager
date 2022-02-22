library(dplyr)
library(kableExtra)

data <- read.csv("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-ErikOnsager/main/scores.csv?token=GHSAT0AAAAAABQLRLGJJP7QGPHDDPEVR4SMYQ4IHPQ")

#adds a column that consolidates SAT subject scores into a single average
data <- data %>% mutate(`Average SAT` = Average.Score..SAT.Math. + 
                          Average.Score..SAT.Reading. + Average.Score..SAT.Writing.)

#selects relevant columns and renames them to be easily readable
data <- select(data, c(School.Name, City, Student.Enrollment, Percent.Tested, 
        Percent.White, Percent.Black, Percent.Hispanic, Percent.Asian, "Average SAT")) %>% rename("School Name" = School.Name, 
        "Student Enrollment" = Student.Enrollment, "Percent Tested" = Percent.Tested, "Percent White" = Percent.White, 
        "Percent Black" = Percent.Black, "Percent Asian" = Percent.Asian, "Percent Hispanic" = Percent.Hispanic)

top.each.city <- data %>% group_by(City) %>% slice_max(order_by = `Average SAT`, n = 1)

kable(top.each.city) %>% kable_styling(bootstrap_options = "striped", full_width = F)
