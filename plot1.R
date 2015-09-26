setwd("~/Desktop/Coursera")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#### Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
## yearly emission levels
emission  <- split(NEI, NEI$year)
## aggregating yearly emission levels
## I divide the result so the chart will be more simple than 6E+
yearlyEmission <- sapply(emission, function(x) colSums(x[c("Emissions")]/1000000))
## plotting total emission
png("plot1.png", width = 480, height = 480)
barplot(yearlyEmission, names.arg = c("1999","2002","2005","2008"), main = "Yearly emission levels in USA", ylab = "Millions")
dev.off()

##  based on the results the USA's emission levels decreased in the observed time period.
