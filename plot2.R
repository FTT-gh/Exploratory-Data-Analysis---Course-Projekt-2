# 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- subset(NEI, NEI$fips=="24510")
SUM <- aggregate(baltimore$Emissions, by=list(year=baltimore$year), FUN=sum)

png(filename='plot2.png')
  plot(SUM$year, SUM$x, xlab = "Years", ylab = "Emissions (emitted, in tons)", main = "Total PM2.5 emissions Baltimore City, Maryland", type="l")
dev.off()

