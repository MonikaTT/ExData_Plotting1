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
names(data)<-names

##Creating a plot and sending it to png file
png(file="./data/plot1.png", width = 480, height = 480)
with(data, hist(data$Global_active_power, col = "red", main = "Global Active Power", 
                xlab = "Global Active Power (kilowatts)"))
dev.off()