#kableExtra
#dplyr::do (summarise med flere verdier), lager liste, m� bruke unnest() for � �pne lista. 

install.packages("gtrendsR")
library(gtrendsR)
library(tidyr)

getwd()
bitcoin_data <- read.csv("R/data/multiTimeline.csv")

bitcoin_trends <- gtrends(keyword = "bitcoin", geo = "", time = "today+5-y",
        gprop = c("web", "news", "images", "froogle", "youtube"),
        category = 0, hl = "en-US", low_search_volume = FALSE,
        cookie_url = "http://trends.google.com/Cookies/NID")

bitcoin_bubble <- gtrends(keyword = "bitcoin", geo = "", time = "2017-07-01 2018-03-21",
                          gprop = c("web", "news", "images", "froogle", "youtube"),
                          category = 0, hl = "en-US", low_search_volume = FALSE,
                          cookie_url = "http://trends.google.com/Cookies/NID")

#unnest(bitcoin_trends) error, no applicable method for unnest
interest_world <- bitcoin_trends[[1]]
countries <- na.omit(bitcoin_trends[[2]])
related_words <- bitcoin_trends[[6]] #relevant?
related_queries <- bitcoin_trends[[7]]

bitcoin_bubble <- bitcoin_bubble[[1]]
plot(bitcoin_bubble$date, bitcoin_bubble$hits, type = "l")
plot(interest_world$date, interest_world$hits, type = "l")

#Interest over time
#Numbers represent search interest relative to the highest point on the chart for the given region and time.
#A value of 100 is the peak popularity for the term. A value of 50 means that the term is half as popular. 
#A score of 0 means there was not enough data for this term.


