# We call all the libraries that we are going to use 
#install.packages("readr")
#install.packages("dlookr")

library(readr)
library(dlookr)


#We import the csv file "loan_sample_9.csv"
data_loans <- read_csv("loan_sample_9.csv")
#We make a copy from the original dataset and we will work with the copy
data <- data_loans

#We check the structure, summary and dimension of our dataset
str(data)
  #looks fine
summary(data)
  #annual_inc = 3rd Qu.:77000 to Max.:400000
  #revol_bal = 3rd Qu.:15792 to Max.:78762
  #tot_cur_bal & total_rev_hi_lim similar observation
overview(data) 
  #Zero missing values



