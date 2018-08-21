# LendingClubLoan_DataAnalysis_and_Prediction
Here are what the data columns represent:
•	credit.policy: 1 if the customer meets the credit underwriting criteria of LendingClub.com, and 0 otherwise.
•	purpose: The purpose of the loan (takes values "credit_card", "debt_consolidation", "educational", "major_purchase", "small_business", and "all_other").
•	int.rate: The interest rate of the loan, as a proportion (a rate of 11% would be stored as 0.11). Borrowers judged by LendingClub.com to be more risky are assigned higher interest rates.
•	installment: The monthly installments owed by the borrower if the loan is funded.
•	log.annual.inc: The natural log of the self-reported annual income of the borrower.
•	dti: The debt-to-income ratio of the borrower (amount of debt divided by annual income).
•	fico: The FICO credit score of the borrower.
•	days.with.cr.line: The number of days the borrower has had a credit line.
•	revol.bal: The borrower's revolving balance (amount unpaid at the end of the credit card billing cycle).
•	revol.util: The borrower's revolving line utilization rate (the amount of the credit line used relative to total credit available).
•	inq.last.6mths: The borrower's number of inquiries by creditors in the last 6 months.
•	delinq.2yrs: The number of times the borrower had been 30+ days past due on a payment in the past 2 years.
•	pub.rec: The borrower's number of derogatory public records (bankruptcy filings, tax liens, or judgments).
 I will predict; not.fully.paid binary column which indicates whether the borrower will be able to pay full amount or not by 0 and 1 value.
 
 Libraries used:
 •  Ggplot2- This is well-known library in R that I used for Data Visualization.
 •	Amelia-This library is used to check any null values present in Dataset.
 •	caTools- I used this package to split data into train and test that is used for training and testing purpose in Machine Learning.
 •	randomForest- This package allows running of Machine Learning classifying model randomForest.
 •	Caret- Here, I used this library to implement feature engineering.
 •	Party- This library allows implement of Machine learning classifying model decision tree.

 I began with loading the data into variable df by using read.csv() command. Then, I checked, if any, null values from the dataset. But there weren’t any null values. Using ggplot library, I plotted histogram of two FICO distributions on top of each other, one for each credit.policy outcome. Similarly, I plotted histogram of two FICO distributions on top of each other, one for each not.fully.paid value. I have use Backward elimination method which works in reverse manner starting with all the attributes in the model and then, eliminating one which can reduce the AIC value. I have eliminated dti, int_rate and days.with.cr.line attribute as it doesn’t have significance on the outcome. Then, I split the data into training and testing dataset with 70:30 ratio.I created logical regression model on training dataset and predicted the value of testing dataset. Evaluated the model by using confusion matrix. Similarly, I created Decision Tree Classifier model and Random Forest Classifier model and evaluated them.
