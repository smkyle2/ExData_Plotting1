# read in entire text file as ";" delimited and with a header
dat <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

# subset to 2007-02-01 and 2007-02-02. Assuming data format is d/m/yyyy
dat2 <- subset(dat, dat$Date == "2/2/2007" | dat$Date == "1/2/2007")

# Add column with Date/Time in the correct format
dat2$date.time <- with(dat2, strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

# create my image file
png(filename = "Plot2.png")

# Make the line graph
with(dat2, plot(date.time, as.numeric(Global_active_power)/1000, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()



with(dat2, plot(date.time, as.numeric(Global_active_power)/1000, type = "l", ylab = "Global Active Power (kilowatts)"))