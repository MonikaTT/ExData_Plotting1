##Dwonloading data
if (!file.exists("data")) {
        dir.create("data")
}
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./data/data.zip", method = "curl")
unzip("./data/data.zip", exdir = "./data")

##Reading in data, header=True, skiping 66636, reading in 2880, na=?
data<-read.table("./data/household_power_consumption.txt",sep = ";", header = FALSE, 
                 skip = 66637, nrows = 2880, na.strings = "?")
names<-read.table("./data/household_power_consumption.txt", sep = ";", header = FALSE, 
                  nrows = 1, na.strings = "?", as.is = 1:9)

##Giving the names of the columns to the datafarame
names(data)<-names

##Creating time data
DateTime<-strptime(with(data, paste(Date, Time, sep = " ")), "%d/%m/%Y %H:%M:%S")

##Changing locale to get English x-axis lables
loc <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "en_GB.UTF-8")

##Creating a plot
png(file="./data/plot2.png", width = 480, height = 480)
plot(DateTime, data$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")
dev.off()

##Going back to origin locale
Sys.setlocale("LC_TIME", loc)


