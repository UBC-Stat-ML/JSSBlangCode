require("ggplot2")
require("dplyr")

data <- read.csv("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/samples/pi.csv")

# ggplot has bad default sizes for large facetting
verticalSize <- 2.0 *  length(unique(data$entry)) 
horizontalSize <- 4.0

n_samples <- max(data$sample)
cut_off <- n_samples * 0.5
data <- subset(data, sample > cut_off)

p <- ggplot(data, aes(x = sample, y = value)) +
  geom_line() + facet_grid(entry ~ .
  , scales="free") + 
  theme_bw() + 
  xlab("MCMC iteration") +
  ylab("sample") +
  ggtitle("Trace plot for: pi")
ggsave("/home/kevinchern/blang/JSSBlangCode/benchmark/Blang/results/all/2019-06-26-10-18-08-Sq9gGpqK.exec/tracePlots/pi.pdf", limitsize = F, height = verticalSize, width = horizontalSize)
