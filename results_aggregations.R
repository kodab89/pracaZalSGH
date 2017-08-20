rm(results_comparison)
results_comparison <- data.frame(hw = 0, arima = 0, day_id = c(1:31))
for (i in 1:31){
  results_comparison$arima[i] <- MLmetrics::MAPE(res1$Point.Forecast[1:i], tsc2016[1:i])
  results_comparison$hw[i] <- MLmetrics::MAPE(res2$fit[1:i], tsc2016[1:i])
}