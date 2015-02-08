plot1 <- function(){

  file <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",file)
  orig <- read.table(unz(file, "household_power_consumption.txt"), header = TRUE, sep = ";", colClasses = "character", stringsAsFactors = FALSE)
  unlink(file)
  
  sub<-orig[orig$Date == "1/2/2007",]
  sub<-rbind(sub, orig[orig$Date == "2/2/2007",])
  
  sub[,3]<-as.numeric(sub[,3])
  sub[,4]<-as.numeric(sub[,4])
  sub[,5]<-as.numeric(sub[,5])
  sub[,6]<-as.numeric(sub[,6])
  sub[,7]<-as.numeric(sub[,7])
  sub[,8]<-as.numeric(sub[,8])
  sub[,9]<-as.numeric(sub[,9])
  
  sub$DateTime<-as.POSIXct(paste(sub$Date,sub$Time), format="%d/%m/%Y %H:%M:%S")
  
  png("plot1.png")
  
  hist(sub$Global_active_power, col = "red", main = "Global Active Power" , xlab = "Global Active Power (kilowatts)")
  
   
  dev.off()
}