require("ggplot2")
require("dplyr")

data <- read.csv("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/samples/means.csv")

# ggplot has bad default sizes for large facetting
verticalSize <- 2.0 *  length(unique(data$index_0)) 
horizontalSize <- 4.0

n_samples <- max(data$sample)
cut_off <- n_samples * 0.5
data <- subset(data, sample > cut_off)
p <- ggplot(data, aes(x = value)) +
  geom_density() + facet_grid(index_0 ~ .
  ) + 
  theme_bw() + 
  xlab("means") +
  ylab("density") +
  ggtitle("Density plot for: means")
ggsave("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/posteriorPlots/means.pdf", limitsize = F, height = verticalSize, width = horizontalSize)
