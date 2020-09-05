# loading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# preparing the data
index <- grep('[cC]oal', SCC[, 3])
NEI <- transform(NEI, SCC = factor(SCC))
SCC.Coal <- SCC[index, 1:2]
SCC.Coal <- merge(NEI, SCC.Coal, by = 'SCC', all = F)
SCC.Coal <- SCC.Coal %>% 
        group_by(type, year) %>% 
        summarize(total.PM2.5 = sum(Emissions, na.rm = T)) %>% 
        data.frame()
#ploting
png(file = 'plot4.png', width = 480, height = 480)
ggplot(SCC.Coal, aes(year, total.PM2.5, col = type)) + 
        geom_line() + 
        geom_point()
dev.off()
