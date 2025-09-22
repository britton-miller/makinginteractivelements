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
