# 4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Only the data with "coal"
SCC_c <- SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE),]

#SCC & NEI data
NEI_c <- merge(NEI, SCC_c, by = "SCC")

year_c <- aggregate(NEI_c[,4], by = list(year = NEI_c$year),FUN = sum)

# Plotting the data with ggplot ( and center title.:-) ) 
png("plot4.png")
  g <- ggplot(year_c,aes(year,x))
  g + geom_line() + geom_point() + labs(x = "Years") + labs(y = "Emissions from PM2.5 (emitted, in tons)") + labs(title = "Coal combustion-related sources from 1999–2008") +
  theme(plot.title = element_text(hjust = 0.5))
dev.off()
