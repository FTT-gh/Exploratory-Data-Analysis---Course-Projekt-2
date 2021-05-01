# 3. Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases
# in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

#Extract baltimore data = 24510
baltimore = subset(NEI, NEI$fips == "24510")

#Sum by year and type (the Emissions) 
baltimore_type <- aggregate(baltimore[,4], by = list(year = baltimore$year,type = baltimore$type), FUN = sum)

png("plot3.png")
  g <- ggplot(baltimore_type, aes(year, x))
  g + facet_grid(. ~ type) + geom_line() + geom_point() + labs(y = "Emissions (emitted, in tons)") + labs(x = "Years") + labs(title = "Total Emissions of PM2.5 in Baltimore City by source type") + theme(plot.title = element_text(hjust = 0.5))
dev.off()
