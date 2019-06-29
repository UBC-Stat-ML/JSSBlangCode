require("ggplot2")
data <- read.csv("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/monitoring/annealingParameters.csv")
p <- ggplot(data, aes(x = round, y = value, colour = factor(chain))) +
  geom_line() +
  ylab("annealingParameters") + scale_y_log10() + 
  theme_bw()
ggsave("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/monitoringPlots/annealingParameters-progress.pdf", limitsize = F)
