require("ggplot2")
data <- read.csv("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/monitoring/actualTemperedRestarts.csv")
p <- ggplot(data, aes(x = round, y = rate)) +
  geom_line() +
  ylab("actualTemperedRestarts rate") + 
  theme_bw()
ggsave("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/monitoringPlots/actualTemperedRestarts.pdf", limitsize = F)
