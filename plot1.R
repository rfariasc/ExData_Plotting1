library(readr)
library(ggplot2)
library(dplyr)


data <- read_delim("household_power_consumption.txt", 
                   delim = ";", escape_double = FALSE, trim_ws = TRUE, na = c('?'))

df = data %>%
  mutate(dt=as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")) %>%
  filter(dt>"2007-02-01" & dt<"2007-02-03")


png("plot1.png", width = 480, height = 480)
par(bg=NA)
hist(x=df$Global_active_power, xlab = 'Global active power (kilowatts)', main = 'Global active power', col='red')
dev.off()
