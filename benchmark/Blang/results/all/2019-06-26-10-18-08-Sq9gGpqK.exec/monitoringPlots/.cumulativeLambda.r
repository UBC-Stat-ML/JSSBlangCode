require("ggplot2")
data <- read.csv("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/monitoring/cumulativeLambda.csv")
p <- ggplot(data, aes(x = beta, y = value, colour = factor(round))) +
  geom_line() +
  ylab("cumulativeLambda") + 
  theme_bw()
ggsave("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/monitoringPlots/cumulativeLambda-progress.pdf", limitsize = F)
