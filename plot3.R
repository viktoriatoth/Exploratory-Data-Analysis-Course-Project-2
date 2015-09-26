##  getting data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Selecting Baltimore City, Maryland
baltimore  <- NEI[ NEI$fips == "24510" ,]

## plotting results
qplot(year, data = baltimore, geom = "bar", weight = Emissions
      , fill = type, ylab = "Total emission"
      , main = "Emission levels in Baltimore by emission type", binwidth = 1.3)

dev.copy(png, file = "plot3.png")## copy histogram to plot2.png
dev.off()
