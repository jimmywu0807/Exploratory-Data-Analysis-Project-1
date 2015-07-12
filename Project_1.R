library(data.table)

HH_Power <- read.table("/Users/jimmy/Downloads/coursera/exploratary data analysis/household_power_consumption.txt",
                       header = TRUE,
                       sep = ";"
                       )
HH_Power.dt <- as.data.table(HH_Power)
rm(HH_Power)

HH_Power.dt_2007 <- HH_Power.dt[Date == '1/2/2007' | Date =='2/2/2007', ]

my_datetime <- strptime(paste(HH_Power.dt_2007$Date, HH_Power.dt_2007$Time), "%d/%m/%Y %H:%M:%S")

HH_Power.dt_2007 <- cbind(HH_Power.dt_2007, my_datetime)

str(HH_Power.dt_2007)

HH_Power.dt_2007$Global_active_power <- as.numeric(as.character((HH_Power.dt_2007$Global_active_power)))
HH_Power.dt_2007$Sub_metering_1 <- as.numeric(as.character((HH_Power.dt_2007$Sub_metering_1)))
HH_Power.dt_2007$Sub_metering_2 <- as.numeric(as.character((HH_Power.dt_2007$Sub_metering_2)))
HH_Power.dt_2007$Sub_metering_3 <- as.numeric(as.character((HH_Power.dt_2007$Sub_metering_3)))
HH_Power.dt_2007$Voltage <- as.numeric(as.character((HH_Power.dt_2007$Voltage)))
HH_Power.dt_2007$Global_reactive_power <- as.numeric(as.character((HH_Power.dt_2007$Global_reactive_power)))

png(file = "plot1.png", width = 480, height = 480)
   
   ## Plot 1
   hist(HH_Power.dt_2007$Global_active_power, 
        col = "red", 
        xlab = "Global Active Power (kilowatts)", 
        ylab = "Frequency",
        main = "Global Active Power"
   )
   title(main = "Global Active Power")

dev.off()



png(file = "plot2.png", width = 480, height = 480)

   ## Plot 2
   with(HH_Power.dt_2007, 
            plot(my_datetime, Global_active_power, 
                 type = "l",
                 ylab = "Global Active Power (kilowatts)")
        )
dev.off()



png(file = "plot3.png", width = 480, height = 480)
   ## Plot 3
   with(HH_Power.dt_2007, 
            plot(my_datetime, Sub_metering_1,
                 type = "l",
                 ylab = "Energy sub metering",
                 col = "black"
                 )
   )
   
   with(HH_Power.dt_2007, 
            points(my_datetime, Sub_metering_2,
                   type = "l",
                   ylab = "Energy sub metering",
                   col = "red"
                  )
   )
   
   with(HH_Power.dt_2007, 
        points(my_datetime, Sub_metering_3,
               type = "l",
               ylab = "Energy sub metering",
               col = "blue"
        )
   )
   
   legend("topright",  lty = 1, y.intersp = 0.3, x.intersp = 0.3, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
   
   
   
png(file = "plot4.png", width = 480, height = 480)
   ## Plot 4
   par(mfrow = c(2,2))
   
   with(HH_Power.dt_2007, 
        plot(my_datetime, Global_active_power, 
             type = "l",
             ylab = "Global Active Power (kilowatts)")
   )
   
   
   with(HH_Power.dt_2007, 
        plot(my_datetime, Voltage, 
             type = "l",
             ylab = "Voltage",
             xlab = "datetime"
        )
   )


   
   with(HH_Power.dt_2007, 
        plot(my_datetime, Sub_metering_1,
             type = "l",
             ylab = "Energy sub metering",
             col = "black"
        )
   )
   
   with(HH_Power.dt_2007, 
        points(my_datetime, Sub_metering_2,
               type = "l",
               ylab = "Energy sub metering",
               col = "red"
        )
   )
   
   with(HH_Power.dt_2007, 
        points(my_datetime, Sub_metering_3,
               type = "l",
               ylab = "Energy sub metering",
               col = "blue"
        )
   )
   
   legend("topright",  lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
   

   
   
   with(HH_Power.dt_2007, 
        plot(my_datetime, Global_reactive_power, 
             type = "l",
             xlab = "datetime")
   )
dev.off()
