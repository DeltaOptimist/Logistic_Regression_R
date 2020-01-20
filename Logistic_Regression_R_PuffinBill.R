# To know the column names in the dataset
names(puffinbill)
print(puffinbill)

# Assign feature to variable
sex <- puffinbill$sex
curlen <- puffinbill$curlen

# Apply encoding on categorical column
sexcode <- ifelse(sex == "F",1, 0)
print(sexcode)

# plot the observation to see the 
plot(curlen, jitter(sexcode, 0.15), pch = 19, xlab = "Bill Length (mm)", ylab = "Sex (0 - male, 1 - female)")
# jitter is used to seperate the points in a variable that is aligned near by 


# fit a generalized logistic regression

model <-glm(sexcode ~curlen, binomial)
summary(model)

# x value sequence to know the min and max of curlen(bill length) with minimum steps
xv <- seq(min(curlen), max(curlen), 0.01)
summary(xv)

yv <- predict(model, list(curlen= xv), type = "response")
summary(yv)

# Drawing the Lines of x & y
lines(xv, yv, col= "red")

install.packages("popbio")
library(popbio)

# used to display freuency distribution of each category
logi.hist.plot(curlen, sexcode, boxp = FALSE, type = "count", col="gray", xlabel = "size")
