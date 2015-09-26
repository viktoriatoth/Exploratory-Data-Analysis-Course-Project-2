##  getting data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##  trying to find out the structure of the dataset
head(SCC)
## Short name and EI.Sector seems good for a start
unique(SCC$Short.Name)
unique(SCC$EI.Sector)

## selecting the coal combustion-related sources
scc_code <- SCC[which (SCC$EI.Sector %in% c("Fuel Comb - Electric Generation - Coal","Fuel Comb - Industrial Boilers, ICEs - Coal","Fuel Comb - Comm/Institutional - Coal")),1]

## subsetting data
coal <- NEI[which (NEI$SCC %in% scc_code) ,]

## plotting data and saving
qplot(year,data=coal, geom = "bar",weight = Emissions/1000, ylab = "Total emission (in thousands)"
      ,main = "Emission level from coal combustion-related sources", binwidth = 1.3 )
dev.copy(png, file = "plot4.png")
dev.off()


## Emmision levels decreased from coal combustion-related sources