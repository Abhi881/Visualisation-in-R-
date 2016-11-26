## importing dataset
movies<- read.csv("Movie-Ratings.csv")
head(movies)  ## visualising top 6 rows
## updating dataset coloumn name into simpler names
colnames(movies)<- c("FIlm", "Genre", "CriticRating", "AudianceRating","BudgetMillions","Year")
head(movies)## visualising top 6 rows
str(movies)## visualising structure of dataset
summary(movies) ## visualising summary of dataset
## converting year coloumn into factors of year from integer
movies$Year<- factor(movies$Year)
str(movies)## visualising structure of dataset
summary(movies) ## visualising summary of dataset
## importing library for visualisation
## importing library for visualisation
library(ggplot2)
# Plot of Movie Data Audiance Rating VS Critic Rating As per Genre Colour & BUdgets in Millon Size
# Chart 1
p<-ggplot(data=movies, aes(x=CriticRating, y=AudianceRating, color=Genre, size= BudgetMillions ))
p + geom_point()+theme(axis.title.x=element_text(color="DarkGreen", size=30),
                       axis.title.y=element_text(color="Red",size=30),
                       axis.text.x=element_text(size=20),
                       axis.text.y=element_text(size=20),legend.title=element_text(size=30),
                       legend.text=element_text(size=20))
## Plot of movie Genre & Year wise(Genre~Year)
# Chart 2: Genre~Year
U<- ggplot(data = movies, aes(x= CriticRating, y=AudianceRating,color= Genre))
U+geom_point(aes(size=BudgetMillions))+ geom_smooth(fill= NA)+ facet_grid(Genre~Year)+
    theme(axis.title.x=element_text(color="DarkGreen", size=30),
          axis.title.y=element_text(color="Red",size=30),
         legend.title=element_text(size=30),
          legend.text=element_text(size=20))

## Movie Budget Distribution
# No Of Movies VS Money Axis
# Chart 3: No Of Movies VS Money Axis
o<- ggplot(data=movies, aes(x= BudgetMillions))
h<-o+geom_histogram(binwidth=10, aes(fill=Genre),color="Black")
h+xlab("Money Axis")+ylab("Number of Movies")+
    ggtitle("Movie Budget Distribution")+
    theme(axis.title.x=element_text(color="DarkGreen", size=30),
          axis.title.y=element_text(color="Red",size=30),
          axis.text.x=element_text(size=20),
          axis.text.y=element_text(size=20),
          legend.title=element_text(size=30),
          legend.text=element_text(size=20),
          legend.position= c(1,1),
          legend.justification=c(1,1),
          plot.title=element_text(color="DarkBlue", size=30))

## Chart 4: Genre Comparision
m<- ggplot(data = movies, aes(x=BudgetMillions))
m + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")+ facet_grid(Genre~.,  scales ="free")+ 
    theme(axis.title.x=element_text(color="DarkGreen", size=30),
          axis.title.y=element_text(color="Red",size=30),
          axis.text.x=element_text(size=20),
          axis.text.y=element_text(size=20),
          legend.title=element_text(size=30),
          legend.text=element_text(size=20))

## Critic rating & Audiance rating Vs count comparision 
# Chart 5: Audiance Rating Vs Count
t<-ggplot(data = movies)
t+ geom_histogram(binwidth = 10, aes(x= AudianceRating), fill="White", color="Red")+
    theme(axis.title.x=element_text(color="DarkGreen", size=30),
          axis.title.y=element_text(color="Red",size=30))
## Chart 6: Critic Rating Vs Count
t+ geom_histogram(binwidth = 10, aes(x=CriticRating ), fill="White", color="Red")+
    theme(axis.title.x=element_text(color="DarkGreen", size=30),
          axis.title.y=element_text(color="Red",size=30))


#--BoxPlot of Audiance Rating As Per Genre
# chart 7

v <- ggplot(data = movies, aes(x= Genre, y=AudianceRating,color= Genre))
v +geom_jitter()+ geom_boxplot(size=1.2, alpha=0.3)+
    theme(axis.title.x=element_text(color="DarkGreen", size=30),
          axis.title.y=element_text(color="Red",size=30),
          legend.title=element_text(size=30),
          legend.text=element_text(size=20))

#--BoxPlot of Critic Rating As Per Genre
# Chart 8
v2 <- ggplot(data = movies, aes(x= Genre, y=CriticRating,color= Genre))
v +geom_jitter()+ geom_boxplot(size=1.2, alpha=0.3)+
    theme(axis.title.x=element_text(color="DarkGreen", size=30),
          axis.title.y=element_text(color="Red",size=30),
          legend.title=element_text(size=30),
          legend.text=element_text(size=20))

