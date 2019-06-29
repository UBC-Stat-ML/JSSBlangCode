require("ggplot2")
require("dplyr")

data <- read.csv("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/samples/logDensity.csv")

# ggplot has bad default sizes for large facetting
verticalSize <- 2.0 *  1 
horizontalSize <- 4.0

n_samples <- max(data$sample)
cut_off <- n_samples * 0.5
data <- subset(data, sample > cut_off)
p <- ggplot(data, aes(x = value)) +
  geom_density() + 
  theme_bw() + 
  xlab("logDensity") +
  ylab("density") +
  ggtitle("Density plot for: logDensity")
ggsave("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/posteriorPlots/logDensity.pdf", limitsize = F, height = verticalSize, width = horizontalSize)
