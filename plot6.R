# 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County,
# California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Baltimore
#Subset from Baltimore and "ON-ROAD"
baltimore_mvehicle <- subset(NEI, NEI$fips == "24510" & NEI$type == 'ON-ROAD')
#Aggregate Baltimore data by year 
cum_baltimore_mvehicle <- aggregate(baltimore_mvehicle[,4], by = list(year = baltimore_mvehicle$year), FUN = sum)
#New column city with citynames in rows
cum_baltimore_mvehicle$City <- c(rep("Baltimore City",nrow(cum_baltimore_mvehicle)))

## Los Angeles 
#Subset from Los Angeles Country and "ON-ROAD"
los_angeles_mvehicle <- subset(NEI, NEI$fips == "06037" & NEI$type == 'ON-ROAD')
#Aggregate Los Angeles data by year 
cum_los_angeles_mvehicle <- aggregate(los_angeles_mvehicle[,4], by = list(year = los_angeles_mvehicle$year), FUN = sum)
#New column city with citynames in rows
cum_los_angeles_mvehicle$City <- c(rep("Los Angeles Country",nrow(cum_los_angeles_mvehicle)))

#Both data.frames together
LA_BA <- rbind(cum_baltimore_mvehicle, cum_los_angeles_mvehicle)

# Plotting the data with ggplot2/tidyverse
png("plot6.png")
qplot(year, x, data = LA_BA, color = City, geom = "line") +
  ggtitle("Emissions by motor vehilcle in Baltimore & Los Angeles") + xlab("Years") + ylab("Emissions from PM2.5 (emitted, in tons)") +
  theme(plot.title = element_text(hjust = 0.5))
dev.off()
