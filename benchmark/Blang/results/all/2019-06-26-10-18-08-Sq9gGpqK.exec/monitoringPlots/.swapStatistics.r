require("ggplot2")
data <- read.csv("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/monitoring/swapStatistics.csv")
p <- ggplot(data, aes(x = round, y = value, colour = factor(chain))) +
  geom_line() +
  ylab("swapStatistics") + 
  theme_bw()
ggsave("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/monitoringPlots/swapStatistics-progress.pdf", limitsize = F)
