##  getting data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Selecting Baltimore City, Maryland
baltimore  <- NEI[ NEI$fips == "24510" ,]
## splitting data by year
baltimore2 <- split(baltimore, baltimore$year)
## yearly emissoin levels
yearlyEmission_BA <- sapply(baltimore2, function(x) colSums(x[c("Emissions")]))
## I checked the data and I saw that in 1999 and 2005 the emission levels were lower than the other years

barplot(yearlyEmission_BA,names.arg = c("1999","2002","2005","2008"), main = "Yearly emission levels in Baltimore City")
## so moving average can help to show the trend in the data
## I found a solution to calculate moving average, which includes the first, starting point as NA
## and calculates average of 3 year, starting from the second element (stg like this : (emission '99 + em. '02 + em.'05)/3)
## rep(1/3,2) does this part
ma  <-  filter(yearlyEmission_BA, rep(1/3,2), sides = 1)

## plotting and saving results
png("plot2.png", width = 480, height = 480)
barplot(yearlyEmission_BA,names.arg = c("1999","2002","2005","2008"), main = "Yearly emission levels in Baltimore City")
lines (ma, col = "blue")
legend("bottom", legend = c("Total emission","Moving average - 3 Yrs"), fill = c("grey","blue"))
dev.off()
## regarding the results emission level seems to be decreasing in Baltimore City, Mariland