## Created fake customer data and added it to an interactive map ##


install.packages("leaflet")

library(leaflet)
library(sp)


data <- read.csv("data.CSV")
View(data)

data1 <- data[complete.cases(data),] 

data$lng <- as.numeric(data$lng)
data$lat <- as.numeric(data$lat)
data$Income <- as(data$Income)

data.SP <- SpatialPointsDataFrame(data[,c(7:8)], data[,-c(7:8)])
#

m <- leaflet() %>% 
  addTiles() %>% 
  addCircles(data= data, lng = ~lng, lat = ~lat, popup = 
               ~paste("<h3>Customer</h3>", 
                      "<b>Company:</b>", 
                      co, 
                      "<br>",
                      "<b>Name:</b>", 
                      first, 
                      "<br>",
                      "<b>Last:</b>", 
                      last,
                      "<br>",
                      "<b>Email:</b>", 
                      email,
                      "<br>", 
                      "<b>Contract Value:</b>", 
                      "$",Income, 
                      "<br>", 
                      "<b>Phone:</b>", 
                      ph, 
                      sep = ))

m

#







##covid <- read.csv("https://data.humdata.org/hxlproxy/api/data-preview.csv?url=https%3A%2F%2Fraw.githubusercontent.com%2FCSSEGISandData%2FCOVID-19%2Fmaster%2Fcsse_covid_19_data%2Fcsse_covid_19_time_series%2Ftime_series_covid19_confirmed_global.csv&filename=time_series_covid19_confirmed_global.csv")

##View(covid)
    