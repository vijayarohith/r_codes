library(e1071)
?naiveBayes #The documentation also contains an example implementation of Titanic dataset
#Next load the Titanic dataset
data(Titanic)
#Save into a data frame and view it
Titanic_df=as.data.frame(Titanic)
View(Titanic_df)

#Creating data from table
repeating_sequence=rep.int(seq_len(nrow(Titanic_df)), Titanic_df$Freq) #This will repeat each combination equal to the frequency of each combination
#Create the dataset by row repetition created
Titanic_dataset=Titanic_df[repeating_sequence,]
#We no longer need the frequency, drop the feature
Titanic_dataset$Freq=NULL
View(Titanic_dataset)
Naive_Bayes_Model=naiveBayes(Survived ~., data=Titanic_dataset)
#What does the model say? Print the model summary
Naive_Bayes_Model

NB_Predictions=predict(Naive_Bayes_Model,Titanic_dataset)
#Confusion matrix to check accuracy
table(NB_Predictions,Titanic_dataset$Survived)
