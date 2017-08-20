package_list <- c("data.table", "forecast", "ggplot2", "lubridate", "MLmetrics", "stats", "tseries", 
                  "weatherData", "moments", "smooth")
lapply(package_list, require, character.only = TRUE)
