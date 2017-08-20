results_forecast0 <- data.frame(MAPE = (1:31), MAE = (1:31), days_aggregated = c(1:31))

for (i in 1:31){
  results_forecast0$MAPE[i] <- MAPE(forecast0$mean[1:i], ts_results2016$fares_no[1:i])
  results_forecast0$MAE[i] <- MAE(forecast0$mean[1:i], ts_results2016$fares_no[1:i])
}

write.csv2(results_forecast0, "C:\\Dropbox\\praca_zal_SGH\\wyniki\\forecast_0.csv")

results_forecast4 <- data.frame(MAPE = (1:31), MAE = (1:31), days_aggregated = c(1:31))

for (i in 1:31){
  results_forecast4$MAPE[i] <- MAPE(forecast4$mean[1:i], ts_results2016$fares_no[1:i])
  results_forecast4$MAE[i] <- MAE(forecast4$mean[1:i], ts_results2016$fares_no[1:i])
}

write.csv2(results_forecast4, "C:\\Dropbox\\praca_zal_SGH\\wyniki\\forecast_4.csv")

results_forecast3 <- data.frame(MAPE = (1:31), MAE = (1:31), days_aggregated = c(1:31))

for (i in 1:31){
  results_forecast3$MAPE[i] <- MAPE(forecast3$mean[1:i], ts_results2016$fares_no[1:i])
  results_forecast3$MAE[i] <- MAE(forecast3$mean[1:i], ts_results2016$fares_no[1:i])
}

write.csv2(results_forecast3, "C:\\Dropbox\\praca_zal_SGH\\wyniki\\forecast_3.csv")
