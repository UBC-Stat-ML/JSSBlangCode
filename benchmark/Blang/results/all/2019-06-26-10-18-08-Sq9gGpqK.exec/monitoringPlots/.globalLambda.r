require("ggplot2")
data <- read.csv("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/monitoring/globalLambda.csv")
p <- ggplot(data, aes(x = round, y = value)) +
  geom_line() +
  ylab("globalLambda value") + 
  theme_bw()
ggsave("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/monitoringPlots/globalLambda.pdf", limitsize = F)
