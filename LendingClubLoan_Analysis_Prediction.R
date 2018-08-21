install.packages('ggplot2')
install.packages('Amelia')
install.packages('tidyr')
install.packages('caTools')
install.packages('rpart')
install.packages('randomForest')
install.packages('MASS')
install.packages('caret')
install.packages('party')
install.packages('corrplot')

library(ggplot2)
library(Amelia)
library(tidyr)
library(caTools)
library(rpart)
library(randomForest)
library(MASS)
library(caret)
library(party)
library(corrplot)

#Loading data from csv to dataframe
df<-read.csv(file = 'loan_data.csv')
head(df)
str(df)
summary(df)

#Checking missing value
missmap(df)

#Data Visualization
ggplot(df, aes(x=fico))+
  geom_histogram(data = subset(df,df$credit.policy==1), fill='blue', alpha=0.5, bins = 30)+
  geom_histogram(data = subset(df,df$credit.policy==0), fill='red', alpha=0.5, bins = 30)

ggplot(df, aes(x=fico))+
  geom_histogram(data = subset(df,df$not.fully.paid==1), fill='blue', alpha=0.5, bins = 30)+
  geom_histogram(data = subset(df,df$not.fully.paid==0), fill='red', alpha=0.5, bins = 30)

ggplot(df, aes(x=purpose))+
  geom_bar(data = subset(df,df$not.fully.paid==0), fill='blue')+
  geom_bar(data = subset(df,df$not.fully.paid==1), fill='red')

ggplot(df, aes(x=fico, y=int.rate)) + 
  geom_point(aes(colour=not.fully.paid))

#Feature Engineering
model<-glm(df$not.fully.paid~., family = binomial(link='logit'), data=df)
step(model, direction = "backward")


drop<-c('dti', 'int.rate', 'days.with.cr.line')
df_acc = df[,!(names(df) %in% drop)]
str(df_acc)


#Train-Test split
sample<-sample.split(df_acc$not.fully.paid, SplitRatio = 0.7)
train<-subset(df_acc, sample==T)
test<-subset(df_acc, sample==F)

#Logical Regression Model
log_model<-glm(not.fully.paid~., family = binomial(link='logit'), data=train)
summary(log_model)
test$predicted<-predict(log_model, newdata = test, type = 'response')
table(test$predicted>=0.5, test$not.fully.paid)

#Decision Tree Classifier Model
tree<-ctree(not.fully.paid~., data=train)
plot(tree,type ='simple')
summary(tree)
pred_tree <- predict(tree, test)
table(pred_tree>=0.5, test$not.fully.paid)
head(pred_tree)
summary(pred_tree)

#Random Forest
rf.model<-randomForest(not.fully.paid~., data=train)
rf.pred<-predict(rf.model,test)
table(rf.pred>=0.5,test$not.fully.paid)

