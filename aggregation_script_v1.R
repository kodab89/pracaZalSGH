require(lubridate)
require(data.table)

hourPL <- function(h) {
  lubridate::hour(h) + 1
}

fileList2016 <- list.files(path="D:\\praca_dyplomowa\\dane\\2016", pattern="*.csv", full.names=T, recursive=FALSE)
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

for(i in 1:length(fileList2016)){

table1 <- fread(fileList2016[i], sep=",", header=TRUE, select = c(2:3,5, 13,19))
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
  
  table1 <- table1[(table1$total_payment< 10000 * mean(table1$total_payment)),]
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

ts_results2016 <- ts_results[-(1),]

#rm(list=setdiff(ls(), c("ts_results2016", "stats_table")))
write.table(ts_results2016, file = "D:\\praca_dyplomowa\\dane\\2016\\ts_results2016.csv", 
            col.names = c("month_id", "day_id", "fares_no"), row.names = FALSE, sep = ";")
  