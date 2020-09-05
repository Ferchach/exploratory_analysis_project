# loading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# preparing the data
baltimore3 <- NEI %>% 
        filter(fips == '24510') %>% 
        group_by(type, year) %>% 
        summarize(total.PM2.5 = sum(Emissions)) %>% 
        data.frame()
# ploting
png(file = 'plot3.png', width = 480, height = 480)
ggplot(baltimore3, aes(year, total.PM2.5, col = type)) + 
	geom_line() + 
	geom_point()
dev.off()