results_forecast_clean1 <- data.frame(MAPE = (1:31), MAE = (1:31), days_aggregated = c(1:31))

for (i in 1:31){
  results_forecast_clean1$MAPE[i] <- MAPE(forecast1c$mean[1:i], ts_results2016$fares_no[1:i])
  results_forecast_clean1$MAE[i] <- MAE(forecast1c$mean[1:i], ts_results2016$fares_no[1:i])
}

write.csv2(results_forecast_clean1, "C:\\Dropbox\\praca_zal_SGH\\wyniki\\forecast_1c.csv")

results_forecast_clean2 <- data.frame(MAPE = (1:31), MAE = (1:31), days_aggregated = c(1:31))

for (i in 1:31){
  results_forecast_clean2$MAPE[i] <- MAPE(forecast2c$mean[1:i], ts_results2016$fares_no[1:i])
  results_forecast_clean2$MAE[i] <- MAE(forecast2c$mean[1:i], ts_results2016$fares_no[1:i])
}

write.csv2(results_forecast_clean2, "C:\\Dropbox\\praca_zal_SGH\\wyniki\\forecast_2c.csv")

results_forecast_clean3 <- data.frame(MAPE = (1:31), MAE = (1:31), days_aggregated = c(1:31))

for (i in 1:31){
  results_forecast_clean3$MAPE[i] <- MAPE(forecast3c$mean[1:i], ts_results2016$fares_no[1:i])
  results_forecast_clean3$MAE[i] <- MAE(forecast3c$mean[1:i], ts_results2016$fares_no[1:i])
}

write.csv2(results_forecast_clean3, "C:\\Dropbox\\praca_zal_SGH\\wyniki\\forecast_3c.csv")