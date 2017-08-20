require(lubridate)
require(data.table)

hourPL <- function(h) {
  lubridate::hour(h) + 1
}

# wdayPL <- function(d){
#   ifelse(lubridate::wday(d)==1,7,lubridate::wday(d)-1)
# }

fileList2015 <- list.files(path="D:\\praca_dyplomowa\\dane\\2015", pattern="*.csv", full.names=T, recursive=FALSE)
ts_results <- data.frame("month_id" = 0, "day_id" = 0, "fares_no" = 0)
loop_id <- 1

for(i in 1:length(fileList2015)){

table1 <- fread(fileList2015[i], sep=",", header=TRUE, select = c(2:3,5, 13,19))
  colnames(table1) <- c("pickup_time", "dropoff_time", "distance", "fare_payment", "total_payment")


# table1$hour_id <- hour_PL(as.POSIXct(table1$pickup_time, format="%Y-%m-%d %H:%M:%S"))
table1$day_id <- lubridate::mday(as.POSIXct(table1$pickup_time, format="%Y-%m-%d %H:%M:%S"))
table1$fares_no <- 1
ts_results1 <- aggregate(cbind(fares_no)~day_id, data=table1, sum)
ts_results1$month_id <- loop_id

rm(table1)
loop_id <- loop_id + 1

ts_results1 <- ts_results1[,c(3,1,2)]
ts_results <- rbind(ts_results, ts_results1)
}

ts_results <- ts_results[-(1),]

rm(list=setdiff(ls(), "ts_results"))
write.table(ts_results, file = "D:\\praca_dyplomowa\\dane\\2015\\ts_results2015.csv", 
            col.names = c("month_id", "day_id", "fares_no"), row.names = FALSE, sep = ";")
  