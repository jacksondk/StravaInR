library(dplyr)
library(ggplot2)
library(tidyverse)

data <- read.csv("c:/tmp/Strava/activities.csv")

commutes <- data %>% 
            filter(Commute.1 == 1) %>% 
            select(Activity.ID, commutes$Activity.Date, Distance, Average.Speed, Wind.Speed, Wind.Bearing)
commutes$Date <- parse_datetime(commutes$Activity.Date, format = "%b %d, %Y, %I:%M:%S %p")
commutes <- commutes[complete.cases(commutes), ]

ggplot(commutes, aes(x=Date, y=Average.Speed*3.6)) + geom_point() + geom_smooth(method = "loess", se = F, formula = (y ~ x), span = 0.5)

