# read and format household data
household <- read.csv2("household_power_consumption.txt")

household[[1]] <- as.Date(household[[1]], format = "%d/%m/%Y")

# get data of interest
household <- household[which(household$Date == "2007-02-01" 
                                | household$Date == "2007-02-02"),]

global_active_power <- as.numeric(as.character(household$Global_active_power))

png(filename = "ExData_Plotting1/figure/plot1.png")
hist(global_active_power, right = FALSE,col=c("red"), 
    main = "Global Active Power", xlab = "Global Active Power (killowatts)")

#close graphics device
dev.off()