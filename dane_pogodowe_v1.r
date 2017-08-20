#install packages/ dependencies & load to R
install.packages('weatherData')
require(weatherData)
#get data
input <- weatherData::getSummarizedWeather(station_id = 'KNYC', "2014-01-01", "2014-12-31", opt_all_columns = TRUE)
output <- input[c(1,4,21,23)]
colnames(output) <- c("date_id", "tempC", "precipitation", "precipitation_type")
output$precipitation <- round(as.numeric(output$precipitation),0)
#export results
write.csv2(output,file = "weather_data_ny2014.csv")