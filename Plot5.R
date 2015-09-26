##  getting data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## searching for columns where I cane find a category that indicates motor vehicles
head(SCC)

SCC[like (SCC$SCC.Level.One, "Vehicle")]
unique(SCC[like (SCC$SCC.Level.Two, "Vehicle"),8])
unique(SCC[like (SCC$SCC.Level.Three, "Vehicle"),9])
## that one seems to be category I need

##  I create a new data frame with motor vehicles' data
motor_vehicles <-  SCC[which (SCC$SCC.Level.Three %in% c("Motor Vehicles: SIC 371","Motor Vehicle Fires")),]
## I subset data from Baltimore City
baltimore_mv <- NEI[which (NEI$SCC %in% scc_code & NEI$fips == "24510" ) ,]

## then I plot the results and save it as a png
qplot(year,data=baltimore_mv, geom = "bar",weight = Emissions
      , ylab = "Total Emission"
      ,main = "Emission level from motor vehicles in Baltimore"
      , binwidth = 1)
dev.copy(png, file = "plot5.png")
dev.off()
## The emission level seems to be missing in 2005, although there's no significant change since 2002.

