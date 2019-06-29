require("dplyr")
data <- read.csv("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/samples/pi.csv")
summary <- data %>%  group_by(entry) %>%  
  summarise( 
    mean = mean(value),
    sd = sd(value),
    min = min(value),
    median = median(value),
    max = max(value)
  )
write.csv(summary, "/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/summaries/pi-summary.csv")
