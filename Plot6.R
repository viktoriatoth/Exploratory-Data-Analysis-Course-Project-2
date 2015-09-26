##  getting data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## I already have the motory vehicles' code in my vector
motor_vehicles <-  SCC[which (SCC$SCC.Level.Three %in% c("Motor Vehicles: SIC 371","Motor Vehicle Fires")),]

## I make a new data frame with LA and Baltimore City
baltimore_mv_la <- NEI[which (NEI$SCC %in% scc_code & (NEI$fips == "24510" | NEI$fips == "06037")) ,]

## Showing fips would not be informative so I make a new column for city names
baltimore_mv_la["city"] <- NA
baltimore_mv_la$city [which (baltimore_mv_la$fips == "24510")]<- "Baltimore City"
baltimore_mv_la$city [which (baltimore_mv_la$fips == "06037")]<- "Los Angeles"

qplot(year,data=baltimore_mv_la, geom ="bar",weight = Emissions
      , ylab = "Total Emission"
      ,main = "Emission level from motor vehicles in Baltimore City and Los Angeles"
      , binwidth = 1.3
      , facets = . ~ city)
dev.copy(png, file = "plot6.png")
dev.off()

##  No difference in the trends of Baltimore City and LA. Emission levels from motor vehicles were the same in 2002 and 
## 2005 in both cities, then it disappeared or we don't have data from 2008.