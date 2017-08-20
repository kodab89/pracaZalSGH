fares2015_clean <- tsclean(fares2015$fares)
clean_fit1 <- auto.arima(ts(fares2015_clean, frequency = 7), D = 1, stepwise = FALSE, num.cores = NULL, trace = TRUE, parallel = TRUE, approximation=FALSE)
clean_fit2 <- arima(ts(fares2015_clean, frequency = 7), order = c(2,0,1), seasonal = list(order = c(1, 1, 1), period = 7))
clean_fit3 <- HoltWinters(ts(fares2015_clean, frequency = 7), beta = T, gamma = T, seasonal = 'additive')

tsdisplay(residuals(clean_fit1))
tsdisplay(residuals(clean_fit2))
tsdisplay(residuals(clean_fit3))

forecast_clean1 <- forecast(clean_fit1, h = 31)
forecast_clean2 <- forecast(clean_fit2, h = 31)
forecast_clean3 <- forecast(clean_fit3, h = 31)

results_forecast_clean1 <- data.frame(MAPE = (1:31), MAE = (1:31), days_aggregated = c(1:31))

for (i in 1:31){
  results_forecast_clean1$MAPE[i] <- MAPE(forecast_clean1$mean[1:i], ts_results2016$fares_no[1:i])
  results_forecast_clean1$MAE[i] <- MAE(forecast_clean1$mean[1:i], ts_results2016$fares_no[1:i])
}

write.csv2(results_forecast_clean1, "C:\\Dropbox\\praca_zal_SGH\\wyniki\\results_forecast_clean1.csv")

results_forecast_clean2 <- data.frame(MAPE = (1:31), MAE = (1:31), days_aggregated = c(1:31))

for (i in 1:31){
  results_forecast_clean2$MAPE[i] <- MAPE(forecast_clean2$mean[1:i], ts_results2016$fares_no[1:i])
  results_forecast_clean2$MAE[i] <- MAE(forecast_clean2$mean[1:i], ts_results2016$fares_no[1:i])
}

write.csv2(results_forecast_clean2, "C:\\Dropbox\\praca_zal_SGH\\wyniki\\results_forecast_clean2.csv")

results_forecast_clean3 <- data.frame(MAPE = (1:31), MAE = (1:31), days_aggregated = c(1:31))

for (i in 1:31){
  results_forecast_clean3$MAPE[i] <- MAPE(forecast_clean3$mean[1:i], ts_results2016$fares_no[1:i])
  results_forecast_clean3$MAE[i] <- MAE(forecast_clean3$mean[1:i], ts_results2016$fares_no[1:i])
}

write.csv2(results_forecast_clean3, "C:\\Dropbox\\praca_zal_SGH\\wyniki\\results_forecast_clean3.csv")





for (i in 1:3){
  paste("forecast_clean", i, sep = "") <- forecast(paste("clean_fit", i, sep = ""), h = 31)
}




fit_list <- vector()
for (i in 1:3){
  fit_list <- c(fit_list, paste("clean_fit", i, sep = ""))
  }
show_results <- function(input){
  paste("results_forecast_clean", i)
}

fit_list <- vector(fit_list, paste("clean_fit", i, sep = "")

forecast_clean1 <- forecast(clean_fit1)


newlist <- list(oldlist, list(someobj))

results_forecast_clean1 <- data.frame(MAPE = (1:31), MAE = (1:31), days_aggregated = c(1:31))

for (i in 1:31){
  results_forecast_clean1$MAPE[i] <- MAPE(forecast0$mean[1:i], ts_results2016$fares_no[1:i])
  results_forecast_clean1$MAE[i] <- MAE(forecast0$mean[1:i], ts_results2016$fares_no[1:i])
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