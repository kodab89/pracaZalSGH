x=1 

while (x<8) 
  
{ 
  vectorx<- 0
  assign(paste("vector",x,sep=""),vectorx) 
  x=x+1 
  
}
rm(x, vectorx)

Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}version
require(lubridate)
require(data.table)
hourPL <- function(h) {
lubridate::hour(h) + 1
}
fileList2015 <- list.files(path="D:\\praca_dyplomowa\\dane\\2015", pattern="*.csv", full.names=T, recursive=FALSE)
ts_results <- data.frame("month_id" = 0, "day_id" = 0, "fares_no" = 0)
loop_id <- 1
stats_table <- as.data.frame(setNames(replicate(5, numeric(0), simplify = F), letters[1:5]))
for(i in 1:length(fileList2015)){
table1 <- fread(fileList2015[i], sep=",", header=TRUE, select = c(2:3,5, 13,19))
colnames(table1) <- c("pickup_time", "dropoff_time", "distance", "fare_payment", "total_payment")
#cleaning data
stats_table$a <- stats_table$a + length(table1$pickup_time)
table1 <- table1[(table1$distance!=0),]
stats_table$b <- stats_table$b + length(table1$pickup_time)
table1 <- table1[(table1$fare_payment!=0),]
stats_table$c <- stats_table$c + length(table1$pickup_time)
table1 <- table1[(table1$total_payment!=0),]
stats_table$d <- stats_table$d + length(table1$pickup_time)
table1 <- table1[(table1$pickup_time!=table1$dropoff_time),]
stats_table$e <- stats_table$e + length(table1$pickup_time)
table1 <- table1[(table1$distance< 1000 * mean(table1$distance)),]
stats_table$f <- stats_table$f + length(table1$pickup_time)
table1 <- table1[(table1$total_payment< 1000 * mean(table1$total_payment)),]
stats_table$g <- stats_table$g + length(table1$pickup_time)
table1$day_id <- lubridate::mday(as.POSIXct(table1$pickup_time, format="%Y-%m-%d %H:%M:%S"))
table1$fares_no <- 1
ts_results1 <- aggregate(cbind(fares_no)~day_id, data=table1, sum)
ts_results1$month_id <- loop_id
rm(table1)
loop_id <- loop_id + 1
ts_results1 <- ts_results1[,c(3,1,2)]
ts_results <- rbind(ts_results, ts_results1)
}
for(i in 1:length(fileList2015)){
table1 <- fread(fileList2015[i], sep=",", header=TRUE, select = c(2:3,5, 13,19))
colnames(table1) <- c("pickup_time", "dropoff_time", "distance", "fare_payment", "total_payment")
#cleaning data
stats_table$a <- stats_table$a + length(table1$pickup_time)
table1 <- table1[(table1$distance!=0),]
stats_table$b <- stats_table$b + length(table1$pickup_time)
table1 <- table1[(table1$fare_payment!=0),]
stats_table$c <- stats_table$c + length(table1$pickup_time)
table1 <- table1[(table1$total_payment!=0),]
stats_table$d <- stats_table$d + length(table1$pickup_time)
table1 <- table1[(table1$pickup_time!=table1$dropoff_time),]
stats_table$e <- stats_table$e + length(table1$pickup_time)
table1 <- table1[(table1$distance< 1000 * mean(table1$distance)),]
stats_table$f <- stats_table$f + length(table1$pickup_time)
table1 <- table1[(table1$total_payment< 1000 * mean(table1$total_payment)),]
stats_table$g <- stats_table$g + length(table1$pickup_time)
table1$day_id <- lubridate::mday(as.POSIXct(table1$pickup_time, format="%Y-%m-%d %H:%M:%S"))
table1$fares_no <- 1
ts_results1 <- aggregate(cbind(fares_no)~day_id, data=table1, sum)
ts_results1$month_id <- loop_id
rm(table1)
loop_id <- loop_id + 1
ts_results1 <- ts_results1[,c(3,1,2)]
ts_results <- rbind(ts_results, ts_results1)
}
fileList2015 <- list.files(path="D:\\praca_dyplomowa\\dane\\2015", pattern="*.csv", full.names=T, recursive=FALSE)
ts_results <- data.frame("month_id" = 0, "day_id" = 0, "fares_no" = 0)
loop_id <- 1
stats_table <- as.data.frame(setNames(replicate(5, numeric(0), simplify = F), letters[1:5]))
for(i in 1:length(fileList2015)){
table1 <- fread(fileList2015[i], sep=",", header=TRUE, select = c(2:3,5, 13,19))
colnames(table1) <- c("pickup_time", "dropoff_time", "distance", "fare_payment", "total_payment")
#cleaning data
stats_table$a <- stats_table$a + length(table1$pickup_time)
table1 <- table1[(table1$distance!=0),]
stats_table$b <- stats_table$b + length(table1$pickup_time)
table1 <- table1[(table1$fare_payment!=0),]
stats_table$c <- stats_table$c + length(table1$pickup_time)
table1 <- table1[(table1$total_payment!=0),]
stats_table$d <- stats_table$d + length(table1$pickup_time)
table1 <- table1[(table1$pickup_time!=table1$dropoff_time),]
stats_table$e <- stats_table$e + length(table1$pickup_time)
table1 <- table1[(table1$distance< 1000 * mean(table1$distance)),]
stats_table$f <- stats_table$f + length(table1$pickup_time)
table1 <- table1[(table1$total_payment< 1000 * mean(table1$total_payment)),]
stats_table$g <- stats_table$g + length(table1$pickup_time)
table1$day_id <- lubridate::mday(as.POSIXct(table1$pickup_time, format="%Y-%m-%d %H:%M:%S"))
table1$fares_no <- 1
ts_results1 <- aggregate(cbind(fares_no)~day_id, data=table1, sum)
ts_results1$month_id <- loop_id
rm(table1)
loop_id <- loop_id + 1
ts_results1 <- ts_results1[,c(3,1,2)]
ts_results <- rbind(ts_results, ts_results1)
}
rm(list = ls())
require(lubridate)
require(data.table)
hourPL <- function(h) {
lubridate::hour(h) + 1
}
fileList2015 <- list.files(path="D:\\praca_dyplomowa\\dane\\2015", pattern="*.csv", full.names=T, recursive=FALSE)
ts_results <- data.frame("month_id" = 0, "day_id" = 0, "fares_no" = 0)
loop_id <- 1
stats_table <- as.data.frame(setNames(replicate(5, numeric(0), simplify = F), letters[1:5]))
for(i in 1:length(fileList2015)){
table1 <- fread(fileList2015[i], sep=",", header=TRUE, select = c(2:3,5, 13,19))
colnames(table1) <- c("pickup_time", "dropoff_time", "distance", "fare_payment", "total_payment")
#cleaning data
stats_tableA <- stats_table$a + length(table1$pickup_time)
table1 <- table1[(table1$distance!=0),]
stats_tableB <- stats_table$b + length(table1$pickup_time)
table1 <- table1[(table1$fare_payment!=0),]
stats_tableC <- stats_table$c + length(table1$pickup_time)
table1 <- table1[(table1$total_payment!=0),]
stats_tableD <- stats_table$d + length(table1$pickup_time)
table1 <- table1[(table1$pickup_time!=table1$dropoff_time),]
stats_tableE <- stats_table$e + length(table1$pickup_time)
table1 <- table1[(table1$distance< 1000 * mean(table1$distance)),]
stats_tableF <- stats_table$f + length(table1$pickup_time)
table1 <- table1[(table1$total_payment< 1000 * mean(table1$total_payment)),]
stats_tableG <- stats_table$g + length(table1$pickup_time)
table1$day_id <- lubridate::mday(as.POSIXct(table1$pickup_time, format="%Y-%m-%d %H:%M:%S"))
table1$fares_no <- 1
ts_results1 <- aggregate(cbind(fares_no)~day_id, data=table1, sum)
ts_results1$month_id <- loop_id
rm(table1)
loop_id <- loop_id + 1
ts_results1 <- ts_results1[,c(3,1,2)]
ts_results <- rbind(ts_results, ts_results1)
}
ts_results2015 <- ts_results[-(1),]
#rm(list=setdiff(ls(), c("ts_results2015", "stats_table")))
write.table(ts_results2015, file = "D:\\praca_dyplomowa\\dane\\2015\\ts_results2015.csv",
col.names = c("month_id", "day_id", "fares_no"), row.names = FALSE, sep = ";")
rm(list = ls())
require(lubridate)
require(data.table)
hourPL <- function(h) {
lubridate::hour(h) + 1
}
fileList2015 <- list.files(path="D:\\praca_dyplomowa\\dane\\2015", pattern="*.csv", full.names=T, recursive=FALSE)
ts_results <- data.frame("month_id" = 0, "day_id" = 0, "fares_no" = 0)
loop_id <- 1
stats_table <- as.data.frame(setNames(replicate(5, numeric(0), simplify = F), letters[1:5]))
for(i in 1:length(fileList2015)){
table1 <- fread(fileList2015[i], sep=",", header=TRUE, select = c(2:3,5, 13,19))
colnames(table1) <- c("pickup_time", "dropoff_time", "distance", "fare_payment", "total_payment")
#cleaning data
stats_tableA <- stats_tableA + length(table1$pickup_time)
table1 <- table1[(table1$distance!=0),]
stats_tableB <- stats_tableB + length(table1$pickup_time)
table1 <- table1[(table1$fare_payment!=0),]
stats_tableC <- stats_tableC + length(table1$pickup_time)
table1 <- table1[(table1$total_payment!=0),]
stats_tableD <- stats_tableD + length(table1$pickup_time)
table1 <- table1[(table1$pickup_time!=table1$dropoff_time),]
stats_tableE <- stats_tableE + length(table1$pickup_time)
table1 <- table1[(table1$distance< 1000 * mean(table1$distance)),]
stats_tableF <- stats_tableF + length(table1$pickup_time)
table1 <- table1[(table1$total_payment< 1000 * mean(table1$total_payment)),]
stats_tableG <- stats_table$G + length(table1$pickup_time)
table1$day_id <- lubridate::mday(as.POSIXct(table1$pickup_time, format="%Y-%m-%d %H:%M:%S"))
table1$fares_no <- 1
ts_results1 <- aggregate(cbind(fares_no)~day_id, data=table1, sum)
ts_results1$month_id <- loop_id
rm(table1)
loop_id <- loop_id + 1
ts_results1 <- ts_results1[,c(3,1,2)]
ts_results <- rbind(ts_results, ts_results1)
}
ts_results2015 <- ts_results[-(1),]
#rm(list=setdiff(ls(), c("ts_results2015", "stats_table")))
write.table(ts_results2015, file = "D:\\praca_dyplomowa\\dane\\2015\\ts_results2015.csv",
col.names = c("month_id", "day_id", "fares_no"), row.names = FALSE, sep = ";")
mr(list = ls())
rm(list = ls())
require(lubridate)
require(data.table)
hourPL <- function(h) {
lubridate::hour(h) + 1
}
fileList2015 <- list.files(path="D:\\praca_dyplomowa\\dane\\2015", pattern="*.csv", full.names=T, recursive=FALSE)
ts_results <- data.frame("month_id" = 0, "day_id" = 0, "fares_no" = 0)
loop_id <- 1
stats_table <- as.data.frame(setNames(replicate(5, numeric(0), simplify = F), letters[1:5]))
for(i in 1:length(fileList2015)){
table1 <- fread(fileList2015[i], sep=",", header=TRUE, select = c(2:3,5, 13,19))
colnames(table1) <- c("pickup_time", "dropoff_time", "distance", "fare_payment", "total_payment")
#cleaning data
stats_tableA <- stats_tableA + length(table1$pickup_time)
table1 <- table1[(table1$distance!=0),]
stats_tableB <- stats_tableB + length(table1$pickup_time)
table1 <- table1[(table1$fare_payment!=0),]
stats_tableC <- stats_tableC + length(table1$pickup_time)
table1 <- table1[(table1$total_payment!=0),]
stats_tableD <- stats_tableD + length(table1$pickup_time)
table1 <- table1[(table1$pickup_time!=table1$dropoff_time),]
stats_tableE <- stats_tableE + length(table1$pickup_time)
table1 <- table1[(table1$distance< 1000 * mean(table1$distance)),]
stats_tableF <- stats_tableF + length(table1$pickup_time)
table1 <- table1[(table1$total_payment< 1000 * mean(table1$total_payment)),]
stats_tableG <- stats_table$G + length(table1$pickup_time)
table1$day_id <- lubridate::mday(as.POSIXct(table1$pickup_time, format="%Y-%m-%d %H:%M:%S"))
table1$fares_no <- 1
ts_results1 <- aggregate(cbind(fares_no)~day_id, data=table1, sum)
ts_results1$month_id <- loop_id
rm(table1)
loop_id <- loop_id + 1
ts_results1 <- ts_results1[,c(3,1,2)]
ts_results <- rbind(ts_results, ts_results1)
}
ts_results2015 <- ts_results[-(1),]
#rm(list=setdiff(ls(), c("ts_results2015", "stats_table")))
write.table(ts_results2015, file = "D:\\praca_dyplomowa\\dane\\2015\\ts_results2015.csv",
col.names = c("month_id", "day_id", "fares_no"), row.names = FALSE, sep = ";")
stats_tableA <- matrix(nrow = 1, ncol = 1)
View(stats_tableA)
stats_tableA <- stats_tableA + length(table1$pickup_time)
View(stats_tableA)
stats_tableA <- matrix(0, nrow = 1, ncol = 1)
stats_tableA <- stats_tableA + length(table1$pickup_time)
x=1
while (x<100)
{
vectorx<- rnorm(100)
assign(paste("vector",x,sep=""),vectorx)
x=x+1
}
rm(list=ls())
x=1
while (x<8)
{
vectorx<- 0
assign(paste("vector",x,sep=""),vectorx)
x=x+1
}
x=1
while (x<8)
{
vectorx<- 0
assign(paste("vector",x,sep=""),vectorx)
x=x+1
}
rm(x, vectorx)
rm(list=ls())
require(lubridate)
require(data.table)
hourPL <- function(h) {
lubridate::hour(h) + 1
}
fileList2015 <- list.files(path="D:\\praca_dyplomowa\\dane\\2015", pattern="*.csv", full.names=T, recursive=FALSE)
ts_results <- data.frame("month_id" = 0, "day_id" = 0, "fares_no" = 0)
loop_id <- 1
#stats_tableA <- matrix(0, nrow = 1, ncol = 1)
x=1
while (x<8)
{
vectorx<- 0
assign(paste("vector",x,sep=""),vectorx)
x=x+1
}
rm(x, vectorx)
for(i in 1:length(fileList2015)){
table1 <- fread(fileList2015[i], sep=",", header=TRUE, select = c(2:3,5, 13,19))
colnames(table1) <- c("pickup_time", "dropoff_time", "distance", "fare_payment", "total_payment")
#cleaning data
vector1 <- vector1 + length(table1$pickup_time)
table1 <- table1[(table1$distance!=0),]
vector2 <- vector2 + length(table1$pickup_time)
table1 <- table1[(table1$fare_payment!=0),]
vector3 <- vector3 + length(table1$pickup_time)
table1 <- table1[(table1$total_payment!=0),]
vector4 <- vector4 + length(table1$pickup_time)
table1 <- table1[(table1$pickup_time!=table1$dropoff_time),]
vector5 <- vector5 + length(table1$pickup_time)
table1 <- table1[(table1$distance< 1000 * mean(table1$distance)),]
vector6 <- vector6 + length(table1$pickup_time)
table1 <- table1[(table1$total_payment< 1000 * mean(table1$total_payment)),]
vector7 <- vector7 + length(table1$pickup_time)
table1$day_id <- lubridate::mday(as.POSIXct(table1$pickup_time, format="%Y-%m-%d %H:%M:%S"))
table1$fares_no <- 1
ts_results1 <- aggregate(cbind(fares_no)~day_id, data=table1, sum)
ts_results1$month_id <- loop_id
rm(table1)
loop_id <- loop_id + 1
ts_results1 <- ts_results1[,c(3,1,2)]
ts_results <- rbind(ts_results, ts_results1)
}
ts_results2015 <- ts_results[-(1),]
#rm(list=setdiff(ls(), c("ts_results2015", "stats_table")))
write.table(ts_results2015, file = "D:\\praca_dyplomowa\\dane\\2015\\ts_results2015.csv",
col.names = c("month_id", "day_id", "fares_no"), row.names = FALSE, sep = ";")
do.call("rbind", list(vector1, vector2, vector))
rbind(vector1, vector2)
wyniki1 <- rbind(vector1, vector2, vector3, vector4, vector5, vector6, vector7)
wyniki1
write.csv2(wyniki1, "D:\\praca_dyplomowa\\dane", sep = ";", header = F)
write.csv(wyniki1, "D:\\praca_dyplomowa\\dane", sep = ";", header = F)
write.csv(wyniki1, "D:\\praca_dyplomowa\\dane")
write.csv(as.data.frame(wyniki1), "D:\\praca_dyplomowa\\dane")
write.csv(as.data.frame(wyniki1), "D:\\praca_dyplomowa\\dane\\")
write.table(wyniki1, file = "D:\\praca_dyplomowa\\dane\\wyniki1.csv", sep = ";", header = F)
write.table(wyniki1, file = "D:\\praca_dyplomowa\\dane\\wyniki1.csv", sep = ";")
memory.limit()
#install packages/ dependencies & load to R
install.packages('weatherData')
require(weatherData)
#get data
input <- weatherData::getSummarizedWeather(station_id = 'KNYC', "2014-01-01", "2014-12-31", opt_all_columns = TRUE)
output <- input[c(1,4,21,23)]
colnames(output) <- c("date_id", "tempC", "precipitation", "precipitation_type")
output$precipitation <- round(as.numeric(output$precipitation),0)
#export results
write.csv2(output,file = "weather_data_ny2014", sep = ";")
install.packages('tibble')
library(tibble)
library(readr)
ts_results2014 <- read_delim("C:/Dropbox/praca_zal_SGH/wyniki/ts_results2014.csv",
";", escape_double = FALSE, trim_ws = TRUE)
View(ts_results2014)
summary(ts_results2014$fares_no)
hist(ts_results2014$fares_no)
scipten(999)
scipten=999
hist(ts_results2014$fares_no)
install.packages('psych')
library(psych)
describe(ts_results2014$fares_no)
Mode <- function(x) {
ux <- unique(x)
ux[which.max(tabulate(match(x, ux)))]
}
Mode(ts_results2014$fares_no)
boxplot(ts_results2014$fares_no)
(scipen = 999)
scipen = 999
boxplot(ts_results2014$fares_no)
ggplot(ts_results2014, aes(fares)) + geom_boxplot()
library(ggplot2)
ggplot(ts_results2014, aes(fares)) + geom_boxplot()
View(ts_results2014)
ggplot(ts_results2014, aes(fares_no)) + geom_boxplot()
ggplot(ts_results2014, aes(class,fares_no)) + geom_boxplot()
options(scipen=5)
boxplot(ts_results2014$fares_no)
boxplot(ts_results2014$fares_no, ts_results2015$fares_no, col = c("blue", "red"),
border=c("blue", "green"))
boxplot(ts_results2014$fares_no, ts_results2015$fares_no, col = c("blue", "orange"),
border=c("gray56", "gray55"))
boxplot(ts_results2014$fares_no, ts_results2015$fares_no, col = c("margineblue2", "orange"),
border=c("gray56", "gray55"))
boxplot(ts_results2014$fares_no, ts_results2015$fares_no, col = c("navyblue2", "orange"),
border=c("gray56", "gray55"))
boxplot(ts_results2014$fares_no, ts_results2015$fares_no, col = c("steelblue3", "salmon2"),
border=c("gray56", "gray55"))
boxplot(ts_results2014$fares_no, ts_results2015$fares_no, col = c("steelblue3", "salmon2"),
border=c("gray56", "gray55"), names = c("2014", "2015"))
boxplot(ts_results2014$fares_no, ts_results2015$fares_no, col = c("steelblue3", "salmon2"),
border=c("gray36", "gray38"), names = c("2014", "2015"))
colors()
fares <- rbind(ts_results2014, ts_results2015))
fares <- rbind(ts_results2014, ts_results2015)
View(fares)
ts_results2014$year <- 2014
ts_results2015$year <- 2015
fares <- rbind(ts_results2014, ts_results2015)
ts.fares <- ts(fares, frequency = 7)
ts.plot(ts.fares)
ts.fares <- ts(fares$fares_no, frequency = 7)
ts.plot(ts.fares)
options(scipen = 6)
ts.plot(ts.fares)
plot(decompose(ts.fares))
dec.ts.fares <- decompose(ts.fares)
plot(dec.ts.fares$random)
plot(decompose(dec.ts.fares$random))
library(stats)
hw.ts.fares <- HoltWinters(ts.fares, beta = F, gamma = F)
hw.ts.fares
hw.ts.fares$fitted
plot(hw.ts.fares)
hw.ts.fares$SSE
ts2.fares <- ts(fares, frequency = 1)
plot(decompose(ts2.fares))
ts2.fares <- ts(fares, deltat =  = 1/52)
ts2.fares <- ts(fares, deltat = 1/52)
plot(decompose(ts2.fares))
ts2.fares <- ts(fares$fares_no, frequency = 1)
plot(decompose(ts2.fares))
ts2.fares <- ts(fares$fares_no, deltat = 1/(52*2))
plot(decompose(ts2.fares))
ts2.fares <- ts(fares$fares_no, deltat = 1/24)
plot(decompose(ts2.fares))
plot(decompose(ts.fares))
plot(decompose(ts2.fares))
plot(tsclean(ts.fares))
plot(ts.fares)
ts3.fares <- tsclean(ts.fares)
plot(decompose(ts3.fares))
plot(log(ts3.fares))
plot(ts3.fares)
plot(fares$fares_no)
ts,plot(fares$fares_no)
ts.plot(fares$fares_no)
plot(ts.fares, ts3.fares)
ts.fares
View(fares)
fares1 <- fares
fares1 <- paste(fares$day_id, fares$month_id, sep = "-")
fares1 <- fares
fares1$time <- paste(fares$day_id, fares$month_id, sep = "-")
View(fares1)
fares_clean <- fares1
fares_clean$fares_no <- tsclean(fares_clean$fares_no)
ggplot() +
geom_line(data = fares1, aes(x = time, y = fares_no, colour = "blue")) +
geom_line(data = fares_clean, aes(x = time, y = fares_no,   colour = "red"))
ts.plot(fares_clean$fares_no)
ts.plot(ts(fares1$fares_no, frequency = 7), ts(fares_clean$fares_no, frequency = 7), gpars = list(col = c("black", "red")))
ts.plot(ts(), y, gpars = list(col = c("black", "red")))
plot(decompose(fares_clean))
plot(decompose(fares_clean$fares_no))
plot(decompose(ts(fares_clean$fares_no, frequency = 7))
)
dec.fares_clean <- decompose(ts(fares_clean$fares_no, frequency = 7))
plot(dec.fares_clean$seasonal)
mean(dec.fares_clean$seasonal / fares_clean$fares_no)
mean(dec.fares_clean$seasonal / fares_clean$fares_no) * 100
plot(dec.fares_clean$trend)
ts4.fares <- ts(ts_results2015$fares_no, frequency = 7)
plot(decompose(ts4.fares))
plot(stl(ts3.fares,s.window="periodic"))
plot(stl(ts(fares_clean),s.window="periodic"))
plot(stl(ts(fares_clean, frequency = 7),s.window="periodic"))
plot(stl(ts(fares_clean$fares_no),s.window="periodic"))
plot(stl(ts(fares_clean$fares_no, frequency = 7),s.window="periodic"))
stl.fares_clean <- stl(ts(fares_clean$fares_no, frequency = 7),s.window="periodic")
plot(stl.fares_clean$weights)
plot(stl.fares_clean$call)
plot(stl.fares_clean$outer)
stl.fares_clean <- stl(ts(fares_clean$fares_no, frequency = 7))
stl.fares_clean$time.series[,"remainder"]
plot(stl.fares_clean)
stl.fares_clean$time.series[,"seasonal"]
plot(stl.fares_clean$time.series[,"seasonal"])
plot(stl.fares_clean)
plot(dec.fares_clean$random)
plot(decompose(dec.fares_clean$random))
dec.noise <- dec.fares_clean$random
noise <- dec.fares_clean$random
dec.noise <- decompose(noise)
plot(dec.noise$seasonal)
plot(dec.noise$random)
abs(dec.noise$random / fares_clean$fares_no) * 100
mean(abs(dec.noise$random / fares_clean$fares_no))
mean(abs(dec.noise$random / fares_clean$fares_no), na.rm = T)
mean(abs(dec.noise$random / fares_clean$fares_no), na.rm = T) * 100
adf.test(ts3.fares, alternative = "stationary")
library(forecast)
library(tseries)
adf.test(ts3.fares, alternative = "stationary")
adf.test(ts(fares_clean$fares_no, frequency = 7), alternative = "stationary")
Acf(fares_clean)
Acf(fares_clean$fares_no)
wyniki1
View(ts_results)
