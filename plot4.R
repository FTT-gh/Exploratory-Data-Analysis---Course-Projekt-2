# 4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library(tidyverse)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#only data with "coal"
SCC_c <- SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE),]

#SCC data and NEI data
NEI_c <- merge(NEI, SCC_c, by = "SCC")

year_c <- aggregate(NEI_coal[,4], by = list(year = NEI_coal$year),FUN = sum)

# plotting the data with ggplot
png("plot4.png")
  g <- ggplot(year_c,aes(year,x))
  g + geom_line() + geom_point() + labs(x = "Years") + labs(y = "Emissions (emitted, in tons)") + labs(title = "Coal combustion-related sources from 1999–2008") + theme(plot.title = element_text(hjust = 0.5))
dev.off()
