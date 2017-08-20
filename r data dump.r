old.par <- par(mfrow=c(2, 1))
plot(ts_freq7 - dec.ts_freq7$trend, main="dec")
plot(detrend.ts_freq7, main="detrend")
par(old.par)


results_agg <- as.vector(NULL)
for (i in 1:31){
  MAPE(a1$forecast[1:i],a1$real[1:i]) -> results_agg[i]
}

boxplot(ts_results2014$fares_no, ts_results2015$fares_no, col = c("steelblue3", "salmon2"),
        border=c("gray36", "gray38"), names = c("2014", "2015"))
		
		ggplot() +
  geom_line(data = fares1, aes(x = time, y = fares_no, colour = "blue")) +
  geom_line(data = fares_clean, aes(x = time, y = fares_no,   colour = "red"))

ts.plot(ts(fares1$fares_no, frequency = 7), ts(fares_clean$fares_no, frequency = 7), gpars = list(col = c("black", "red")))

plot(stl(ts(fares_clean$fares_no, frequency = 7),s.window="periodic"))
stl.fares_clean <- stl(ts(fares_clean$fares_no, frequency = 7),s.window="periodic")
foo$time.series[,"remainder"]


plot(stl.fares_clean)
stl.fares_clean$time.series[,"remainder"]

library('reshape2')
library('ggplot2')
melted = melt(a1, id.vars = 'time')
ggplot(data=melted, aes(x=time, y=value, group=variable), colour=variable) + geom_line()


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
}