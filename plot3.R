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

sub_metering_1 <- as.numeric(as.character(household$Sub_metering_1))
sub_metering_2 <- as.numeric(as.character(household$Sub_metering_2))
sub_metering_3 <- as.numeric(as.character(household$Sub_metering_3))

# plot 
png(filename = "ExData_Plotting1/figure/plot3.png")

with(household, plot(x = Date, y = Sub_metering_1, type = "n", 
                     ylab="Energy sub metering", xlab = "",
                     ylim = c(0,38)))

with(household, lines(x = Date, y = sub_metering_1, col=c("black")))
with(household, lines(x = Date, y = sub_metering_2, col=c("red")))
with(household, lines(x = Date, y = sub_metering_3, col=c("blue")))

legend("topright", lty = 1, col = c("black", "red","blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#close graphics device
dev.off()
