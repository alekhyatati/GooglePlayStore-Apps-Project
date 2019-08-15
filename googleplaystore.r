library(ggplot2)
library(dplyr)
data=read.csv("googleplaystore.csv")
summary(na.omit(data$Rating))
dim(data)
corrupted=data %>% filter(Rating==19)
corrupted
data=subset(data, Category != "1.9")
summary(na.omit(data$Rating))
ggplot(data, aes(x = Rating)) + 
  geom_histogram()
data=data %>% mutate(Price=na.omit(as.double(gsub("\\$","", Price))))
summary(data$Price)
ggplot(data, aes(x = Price)) + 
  geom_histogram()
data=data %>% mutate(Reviews = na.omit(as.numeric(levels(data$Reviews))[data$Reviews]))
summary(data$Reviews)
ggplot(data, aes(x = Reviews)) + 
  geom_histogram()

