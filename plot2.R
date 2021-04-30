## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

# 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.SUM <- aggregate(NEI$Emissions, by=list(year=NEI$year), FUN=sum)

baltimore <- subset(NEI, NEI$fips=="24510")
SUM <- aggregate(baltimore$Emissions, by=list(year=baltimore$year), FUN=sum)

png(filename='plot2.png')
  plot(SUM$year, SUM$x, xlab = "Years", ylab = "Emission (emitted, in tons)", main = "Total PM2.5 emission Baltimore City, Maryland", type="l")
dev.off()

