install.packages("plotly")
library(plotly)
install.packages("ggplot2")
library(ggplot2)
install.packages("WDI")
library(WDI)

WDIsearch("gdp per capita")
country_codes <- c("CA", "BE", "FR", "MX", "US", "NL")
gdp_data <- WDI(indicator = "NY.GDP.PCAP.CD", country =
                  country_codes, 
                start = 2000, 
                end = 2024)

head(gdp_data)

gdp_plot <- ggplot(gdp_data, aes(x = year, y = NY.GDP.PCAP.CD, color = country)) +
  geom_line() + 
  labs(title = "GDP Per Capita (2000-2024)",
       subtitle = "Comparison of GDP for Rwanda, its Neighbors, Holland, and the US", x = "Year", y = "GDP Per Capita (current US$)", color = "Country") +
  theme_minimal()

interactive_plot <- ggplotly(gdp_plot)

interactive_plot

#export
install.packages("htmlwidgets")
library(htmlwidgets)

saveWidget(interactive_plot, file = "my_interactive_graph.html", selfcontained = TRUE)

#send to chartstudio
#----------------------------
#create interactive map showing the same data
#this data will be easily adjustable 

install.packages("rworldmap")
library("rworldmap")
install.packages("leaflet")
library(leaflet)
install.packages("maps")
library(maps)
install.packages("sf")
library(sf)
install.packages("rnaturalearth")
library(rnaturalearth)
install.packages("rnaturalearthdata")
library(rnaturalearthdata)
install.packages("dplyr")
library(dplyr)
install.packages("htmltools")
library(htmltools)

world <- ne_countries(scale = "medium", returnclass = "sf")

world_gdp <- world %>%
  left_join(gdp_data, by = "name_long")


world_map <- st_as_sf(map("world", plot = FALSE, fill = TRUE))

world_map_wgs84 <- st_transform(world_map, crs = 4326)


basic_map <- leaflet(world_map_wgs84) %>% 
  addTiles() %>%
  addPolygons(
    color = "#444444",
    weight = 1,
    opacity = 1,
    fillOpacity = 0.5,
    fillColor = "gray",
    highlightOptions = 
      highlightOptions(
        weight = 2,
        color = "blue",
        fillOpacity = 0.8,
        bringToFront = TRUE)
  )

basic_map

#export
install.packages("htmlwidgets")
library(htmlwidgets)

f


  )