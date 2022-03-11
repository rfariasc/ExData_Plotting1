library(readr)
library(ggplot2)
library(dplyr)


data <- read_delim("household_power_consumption.txt", 
                   delim = ";", escape_double = FALSE, trim_ws = TRUE, na = c('?'))

df = data %>%
  mutate(dt=as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")) %>%
  filter(dt>"2007-02-01" & dt<"2007-02-03")


png("plot3.png", width = 480, height = 480)
par(bg=NA)
plot(x=df$dt, y=df$Sub_metering_1, type="l", xlab = '',  ylab = 'Energy sub metering')
lines(x=df$dt, y=df$Sub_metering_2, col='red')
lines(x=df$dt, y=df$Sub_metering_3, col='blue')
legend('topright', legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c('black', 'red', 'blue'), lty = c(1,1,1))
dev.off()
