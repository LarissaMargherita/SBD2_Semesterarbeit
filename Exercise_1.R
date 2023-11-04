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
head(data)
  #looks fine
summary(data)
  #annual_inc = 3rd Qu.:77000 to Max.:400000
  #revol_bal = 3rd Qu.:15792 to Max.:78762
  #tot_cur_bal & total_rev_hi_lim similar observation
overview(data) 
  #Zero missing values

#We check numeric and categorical variables
variable_classes <- sapply(data, class)
total_numeric <- sum(variable_classes == "numeric")
total_character <- sum(variable_classes == "character")

cat("Total numeric variables:", total_numeric)
cat("Total character variables:", total_character)

#Summary of the variables
summary(data)

#Visualization of the level of the target variable
#Load the ggplot2 library
library(ggplot2)
ggplot(data, aes(x = data$Status)) +
  geom_bar() +
  labs(title = "Bar Plot of Target Variable", x = "Status", y = "Loan")
#Stimmt x y Bezeichnung, #Is it balanced?


#Check distribution of the numeric variables
# Create histograms for numeric variables
for (col in names(data)) {
  if (is.numeric(data[[col]])) {
    print(ggplot(data, aes(x = data[[col]])) +
            geom_histogram(binwidth = 0.5) +
            labs(title = paste("Histogram of", col)))
  }
}

#Create density plots for numeric variables
for (col in names(data)) {
  if (is.numeric(data[[col]])) {
    print(ggplot(data, aes(x = data[[col]])) +
            geom_density() +
            labs(title = paste("Density Plot of", col)))
  }
}


#Variables contain outliers
ggplot(data, aes(x = data$Status)) +
  geom_bar(size = 1,
               outlier.shape = 1, 
               outlier.color = "black",
               outlier.size = 3) 


#Target value with default
ggplot(Default, aes(x  = default, 
y = status)) +
  geom_boxplot(fill = "steelblue", 
               alpha = .5) +
  labs(title = "XY distribution by default status")




  ######################################################



# -------------------------------- COMBINING GRAPHS ---------------------------------------#
# Plot the distribution of salaries by rank using jittering
# Let's also improve the graph. We are changing the labels of the Rank variable 
# and we are adding some graph features.

ggplot(Salaries, 
       aes(x = factor(rank,
                      labels = c("Assistant\nProfessor",
                                 "Associate\nProfessor",
                                 "Full\nProfessor")), 
           y = salary, 
           color = rank)) +
  geom_boxplot(size = 1,                         # size of the box plot
               outlier.shape = 1,                # shape of the outlier
               outlier.color = "black",          # color of the outlier
               outlier.size  = 3) +              # size of the outlier
  geom_jitter(alpha = 0.5, 
              width = .2) + 
  scale_y_continuous(label = dollar) +
  labs(title = "Academic Salary by Rank", 
       subtitle = "9-month salary for 2008-2009",
       x = "",
       y = "") +
  theme_minimal() +
  theme(legend.position = "none") 


# DATA VISUALIZATION V
# Calculate the correlations between the variables 
corr <- cor(economics[-1])
corr

# Visualization methods - full matrix 
?corrplot
corrplot(corr) # default method is the circle 
corrplot(corr, method = "pie") # we can also change the method 
corrplot(corr, method = "color")
corrplot(corr, method = "number")

#####################################################

# Boxplot
ggplot(Default, aes(x  = default, 
                    y = income)) +
  geom_boxplot(fill = "steelblue", 
               alpha = .5) +
  labs(title = "Income distribution by default status")

######################################################