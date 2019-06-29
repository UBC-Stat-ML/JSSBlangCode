require("ggplot2")
require("dplyr")

data <- read.csv("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/samples/indicators.csv")

# ggplot has bad default sizes for large facetting
verticalSize <- 2.0 *  length(unique(data$index_0)) 
horizontalSize <- 4.0

n_samples <- max(data$sample)
cut_off <- n_samples * 0.5
data <- subset(data, sample > cut_off)
data <- data %>%
  group_by(index_0,value) %>%
  summarise(
    frequency = n()
  )

p <- ggplot(data, aes(x = value, y = frequency, xend = value, yend = rep(0, length(frequency)))) +
  geom_point() + geom_segment() + facet_grid(index_0 ~ .
  ) + 
  theme_bw() + 
  xlab("indicators") +
  ylab("frequency") +
  ggtitle("Probability mass function plot for: indicators")
ggsave("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/posteriorPlots/indicators.pdf", limitsize = F, height = verticalSize, width = horizontalSize)
