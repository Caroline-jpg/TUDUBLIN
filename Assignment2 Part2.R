

#Q1
weather <- read.csv("weather_data.csv") 
names(weather)
head(weather)
tail(weather)
# Q2
summary(weather$HPCP)
sd(weather$HPCP)
weather$DATE

library(dplyr)
#Remove any date rows containing 2013 and store in dataframe weatherNEW
weatherNEW <- weather[- grep("2013", weather$DATE),]
tail(weatherNEW)

# Q3.
library(tidyr)
install.packages("TSA")
library('TSA')

weatherSep <- tidyr::separate(weatherNEW, DATE, c("Date", "Time"), sep = " ")
names(weatherSep)


# splitDateTime <- separate(data = weather, col = DATE, into = )

weatherSep$Date <- parse_date_time(weatherSep$Date, orders = "ymd")
colSums(is.na(weatherSep))

wettest_month <- weatherSep %>%
mutate(month = month(weatherSep$Date)) %>%
group_by(month) %>%

summarize(avg = mean(HPCP))  %>%
filter(avg == max(avg))  %>%
print() # July is the wettest month 

# 
library(stringr)
as.numeric(str_replace_all(weatherSep$Time, ":", ""))

summarize(avg = mean(HPCP))



