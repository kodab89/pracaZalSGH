#TS: Taxi forecasting - naive method


#generowanie tabeli z wynikami dopasowania
naiveForecastResults <- data.frame(day_id = 1:31, MAPE = 0, MAE = 0)
for (i in 1:31) {
  naiveForecastResults$MAPE[i] <-  MLmetrics::MAPE(kursy2015$ilosc_kursow[1:i], kursy12016$ilosc_kursow[1:i])
  naiveForecastResults$MAE[i] <- MLmetrics::MAE(kursy2015$ilosc_kursow[1:i], kursy12016$ilosc_kursow[1:i])
  
}

naiveForecastResults$MAPE <- round(naiveForecastResults$MAPE, 4)

#eksportowanie wyników
write.csv2(naiveForecastResults, "results//naiveForecastResults.csv")

#wykres liniowy porównanie prognozy z danymi rzeczywistymi
naiveFcstVsReal <- data.frame(naive15 = kursy2015$ilosc_kursow[1:31], real16 = kursy12016$ilosc_kursow[1:31], day_id = 1:31)

n1 <- ggplot(naiveFcstVsReal, aes(day_id))
n1 <- n1 + geom_line(aes(y=naive15, colour="blue"))
n1 <- n1 + geom_line(aes(y=real16, colour="red"))
n1 <- n1 + scale_color_discrete(name = "", labels = c("2015", "2016"))
n1 <- n1 + labs(x = "dni stycznia 2016", y = "dzienna ilosc kursow taksowek")
n1