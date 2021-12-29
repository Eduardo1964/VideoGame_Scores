#Calling the dataset
ratings <- read.csv(file = 'VG_scores.csv')
head(ratings)
colnames(ratings)
library(dplyr)
platform_games <- ratings %>% group_by(platform) %>% summarise(meta_score=mean(meta_score))
colnames(platform_games)

platform_games <- platform_games[order(-platform_games$meta_score,na.last=TRUE),]%>%mutate(meta_score=round(meta_score, digits=1))
platform_games <-round(platform_games$meta_score,digits=1)
View(platform_games)
