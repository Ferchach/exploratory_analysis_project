# loading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# preparing the data
baltimore2 <- NEI %>% 
        filter(fips == '24510') %>% 
        group_by(year) %>% 
        summarize(total.PM2.5 = sum(Emissions)) %>% 
        data.frame()
# ploting
png(file = 'plot2.png', width = 480, height = 480)
with(baltimore2, plot(year, total.PM2.5, type = 'b', pch = 19))
dev.off()