# loading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# preparing the data
baltimore5 <- NEI %>% 
        filter(fips == '24510' & type == 'ON-ROAD') %>% 
        group_by(year) %>% 
        summarize(total.PM2.5 = sum(Emissions)) %>% 
        data.frame()
#ploting
png(file = 'plot5.png', width = 480, height = 480)
ggplot(baltimore5, aes(year, total.PM2.5)) + 
        geom_point() + 
        geom_line()
dev.off()
