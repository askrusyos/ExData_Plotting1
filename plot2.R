## Note: the initial steps - reading the data and creating a smaller dataset for the two days
## that are needed, 1st and 2nd february 2007 - are the same for each of the four scripts.

# Read the data
dataset <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", dec = ".", na.strings = "?")

# Manipulation of the Date and Time columns to get a new column with the dates in POSIXlt format
dataset$newDate <- paste(dataset$Date," ", dataset$Time)
dataset$newDate <- strptime(dataset$newDate, format = "%d/%m/%Y %T")

# Now we can select the two days we are interested in. First we find where these two days 
# are placed within the "newDate" vector, using the grep function. Then we create a new dataset
# from that.
indexes <- grep(dataset$newDate, pattern = "2007-02-0[1-2]")
dataset_feb <- dataset[indexes,3:10]
rm(dataset, indexes)

# Creation of the plot.
# To produce the lines plot (without the default 'dots' used by R) the parameter type = "l" 
# in the plot() function call has been specified.
png(filename = "plot2.png", width = 480, height = 480)
plot(dataset_feb$newDate, dataset_feb$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type ="l")
dev.off()