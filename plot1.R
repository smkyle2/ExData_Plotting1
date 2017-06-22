# read in entire text file as ";" delimited and with a header
dat <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)

# subset to 2007-02-01 and 2007-02-02. Assuming data format is d/m/yyyy
dat2 <- subset(dat, dat$Date == "2/2/2007" | dat$Date == "1/2/2007")

# Add column with Date/Time in the correct format
dat2$date.time <- with(dat2, strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

# create my image file
png(filename = "Plot1.png")

# Make the histogram
hist(as.numeric(dat2$Global_active_power), col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()