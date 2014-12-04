# read and format household data
household <- read.csv2("household_power_consumption.txt")

household[[1]] <- as.Date(household[[1]], format = "%d/%m/%Y")

# get data of interest
household <- household[which(household$Date == "2007-02-01" 
                             | household$Date == "2007-02-02"),]

# combine date and time columns
household <- data.frame(Date = paste(household[[1]], household[[2]]), 
                         household[,3:length(household)])

# convert first column to date/time
household[[1]] <- strptime(household[[1]],format = "%Y-%m-%d %H:%M:%S")

global_active_power <- as.numeric(as.character(household$Global_active_power))

# plot 
png(filename = "ExData_Plotting1/figure/plot2.png")
with(household, plot(x = Date, y = global_active_power, type = "lines",
                     ylab="Global Active Power (kilowatts)", xlab = ""))

#close graphics device
dev.off()
