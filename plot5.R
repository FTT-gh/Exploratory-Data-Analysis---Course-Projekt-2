# 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset from Baltimore and "ON-ROAD"
baltimore_mvehicle <- subset(NEI, NEI$fips == "24510" & NEI$type == 'ON-ROAD')

#Aggregate data by year 
cum_baltimore_mvehicle <- aggregate(baltimore_mvehicle[,4], by = list(year = baltimore_mvehicle$year), FUN = sum)

# Plotting the data with ggplot
png("plot5.png")
  g <- ggplot(cum_baltimore_mvehicle,aes(year,x))
  g + geom_line() + geom_point() + labs(x = "Years") + labs(y = "Emissions from PM2.5 (emitted, in tons)") + labs(title = "Emissions by motor vehilcle in Baltimore, Maryland") + theme(plot.title = element_text(hjust = 0.5))
dev.off()
