getwd()
data<-read.csv("r_scripts/movie_metadata.csv")
class(data)
View(data)

data_fil <- aggregate(data$movie_title, by = list(data$title_year), FUN = length )
plot(data_fil)














