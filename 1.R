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