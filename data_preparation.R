#rbind wszystkich rocznych zestawien
#Usuniecie wartosci odstajacych
ts_total3$fares_no_clean <- forecast::tsclean(ts(ts_total3$fares_no))

ts1 <- ts(ts2$fares_no, start = 1, end = 365, frequency = 12)