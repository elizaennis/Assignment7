#HRP 203
#Eliza Ennis
#Homework 7

#load data
cohort_data<-read.csv("/Users/catharinebowman/Documents/GitHub/Assignment7/raw-data/cohort.csv") 
#Make sure to use relative path, read.csv vs. read_csv! 

#Adding a little "Packages" section up front might ensure no packages are missed! 
#make table describing variables
library(arsenal)
library(dplyr)
#Load ggplot2 
library(ggplot2)

#Maybe explain what these are for (i.e. "why vs what" principle) - I imagine they are part of the table
# If you use "summary()" function, you will get min max mean median and can add sd ("efficiency" principle)
str(cohort_data)
total_smoke <-sum(cohort_data$smoke) 
total_female <-sum(cohort_data$female)
total_cardiac <-sum(cohort_data$cardiac)
per_smoke <-total_smoke/nrow(cohort_data)
per_female <-total_female/nrow(cohort_data)
per_cardiac <-total_cardiac/nrow(cohort_data)
min_age <- min(cohort_data$age, na.rm = TRUE)  
mean_age <- mean(cohort_data$age, na.rm = TRUE)
sd_age  <- sd(cohort_data$age, na.rm = TRUE)
max_age <- max(cohort_data$age, na.rm = TRUE)
min_cost <- min(cohort_data$cost, na.rm = TRUE)  
mean_cost <- mean(cohort_data$cost, na.rm = TRUE)
sd_cost  <- sd(cohort_data$cost, na.rm = TRUE)
max_cost <- max(cohort_data$cost, na.rm = TRUE)

table1 <- data.frame(
  Variable = c("Smokers", "Females", "Cardiac Patients", "Age", "Cost"),
  Total = c(total_smoke, total_female, total_cardiac, NA, NA),
  Percentage = c(round(per_smoke,2), round(per_female,2), round(per_cardiac,2), NA, NA),
  Min = c(NA, NA, NA, round(min_age,2), round(min_cost,2)),
  Mean = c(NA, NA, NA, round(mean_age,2), round(mean_cost,2)),
  SD = c(NA, NA, NA, round(sd_age,2), round(sd_cost,2)),
  Max = c(NA, NA, NA, round(max_age,2), round(max_cost,2))
)

print(table1) #Function called "table()" makes a pretty table too! 

#lm analysis to determine variable relationships #Great explaining! 
#response variables: cardiac & cost
#predictor variables: female, smoke, age
(model1 <- lm(cost ~ age + smoke + female, data = cohort_data))
model1_interaction <- lm(cost ~ age * smoke * female, data = cohort_data)
summary(model1_interaction)
#cost higher with greater age, smoke, and maleness
(model2 <- lm(cardiac ~ age + smoke + female, data = cohort_data))
model2_interaction <- lm(cardiac ~ age * smoke * female, data = cohort_data)
summary(model2_interaction)
#cardiac event larger with more smoke and decreases slightly with men and age
(model3 <- lm(cost ~ age + smoke + female+cardiac, data = cohort_data))
#cost increases with age and smoke and cardiac events. Reduction of cost for women
(model4 <- lm(cardiac ~ age + smoke + female+cost, data = cohort_data))
#cardiac session decreases with age and smoke, but increases when female and expensive. Very small values

#figure #Maybe describe steps?
ggplot(cohort_data, aes(x = age, y = cost, color = as.factor(smoke), shape = as.factor(female))) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(
    title = "Cost and Age by Smoke Status and Gender",
    color = "Smoke status",
    shape = "Gender"
  ) +
  scale_color_discrete(labels = c("No Smoke", "Smoke")) +
  scale_shape_discrete(labels = c("Male", "Female")) +
  theme_minimal()
#affirms that higher cost with smoke, age, maleness

