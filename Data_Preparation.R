# Read data
df <- read.csv('/Users/Areil/Desktop/kc_house_data.csv')

# Remove column that has no impact for performance, and adjust data type
df$id <- NULL
df$date<-NULL
df$zipcode<-NULL
df$long<-NULL
df$lat<-NULL
df$yr_built<-NULL
df$waterfront <- as.factor(df$waterfront)
df$sale_date <-as.factor(df$sale_date)
#year_renovated =0 if no renovated, equals 1 if the house has been renovated no matter the year
df$yr_renovated <- ifelse(df$yr_renovated==0,0,1)
#get the avg price, if the price > avg.price,defined as expensive==1, otherwise 0
mean_price<-mean(df$price)
mean_price
df$expensive<-ifelse(df$price>mean_price,1,0)

# Seperate 70% of data as training data, 30% as test data
set.seed(12345)
inTrain <- sample(nrow(df), 0.7*nrow(df))
dftrain <- df[inTrain,]
dftest <- df[-inTrain,]