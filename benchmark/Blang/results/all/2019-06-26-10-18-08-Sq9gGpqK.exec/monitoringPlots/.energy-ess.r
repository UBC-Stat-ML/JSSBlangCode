require("ggplot2")
data <- read.csv("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/ess/energy-ess.csv")
p <- ggplot(data, aes(x = chain, y = value)) +
  geom_line() +
  ylab("energy-ess value") + 
  theme_bw()
ggsave("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/monitoringPlots/energy-ess.pdf", limitsize = F)
