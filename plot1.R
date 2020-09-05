# loading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# preparing the data
NEIsub <- NEI %>% 
        group_by(year) %>% 
        summarize(total.PM2.5 = sum(Emissions)) %>% 
        data.frame
# ploting
png(file = 'plot1.png', width = 480, height = 480)
with(NEIsub, plot(year, total.PM2.5, type = 'b', pch = 19))
dev.off()
