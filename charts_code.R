ggplot() + geom_line(data = ts_total3, aes(x = ts_total3$date, y = ts_total3$fares_no, group = 1, colour = "original")) + 
            geom_line(data = ts_total3, aes(x = ts_total3$date, y = ts_total3$fares_no_clean, group = 1, colour = "clean")) + 
  scale_y_continuous(name="no of fares", labels = comma)


ggplot() + 
  geom_line(data = ts14, aes(x = ts14$date, y = ts14$fares_no, group = 1, colour = "original")) + 
              scale_y_continuous(name="no of fares", labels = comma)