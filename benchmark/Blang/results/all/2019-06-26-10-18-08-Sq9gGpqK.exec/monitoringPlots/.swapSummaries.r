require("ggplot2")
data <- read.csv("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/monitoring/swapSummaries.csv")
p <- ggplot(data, aes(x = round, y = average)) +
  geom_line() +
  ylab("swapSummaries average") + 
  theme_bw()
ggsave("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/monitoringPlots/swapSummaries.pdf", limitsize = F)
