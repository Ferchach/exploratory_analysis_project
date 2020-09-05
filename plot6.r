# loading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# preparing the data
baltimore_LA <- NEI %>%
        filter((fips == '24510' | fips == '06037') & type == 'ON-ROAD') %>%
        group_by(fips, year) %>%
        summarize(total.PM2.5 = sum(Emissions)) %>% 
        data.frame()
# ploting
png(file = 'plot6.png', width = 480, height = 480)
ggplot(baltimore_LA, aes(year, total.PM2.5, col = fips)) +
        geom_point() + 
        geom_line()
dev.off()