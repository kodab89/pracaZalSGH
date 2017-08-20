ggplot() +
  geom_line(data = fares1, aes(x = time, y = fares_no, colour = "blue")) +
  geom_line(data = fares_clean, aes(x = time, y = fares_no,   colour = "red"))

ts.plot(ts(fares1$fares_no, frequency = 7), ts(fares_clean$fares_no, frequency = 7), gpars = list(col = c("black", "red")))

plot(stl(ts(fares_clean$fares_no, frequency = 7),s.window="periodic"))
stl.fares_clean <- stl(ts(fares_clean$fares_no, frequency = 7),s.window="periodic")
foo$time.series[,"remainder"]


plot(stl.fares_clean)
stl.fares_clean$time.series[,"remainder"]