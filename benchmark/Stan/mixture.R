library(rstan)
data <- read.csv("../data/mixture_data.csv")

test = stan(file = mixture.stan, model_name = "Mixture", 
            data = standat, iter = 7000, warmup=2000, thin=5, chains = 2, cores=2,
            verbose = F)

