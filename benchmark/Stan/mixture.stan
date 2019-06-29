data {
  int<lower=1> K;                                           
  int<lower=1> N;                                           
  real y[N];                                                
}

parameters {
  simplex[K] pi;                                            
  real mu[K];
  real<lower=0> sigma[K];                                   
  int<lower=1, upper=K> indicators[N];
}

model {
  // prior
  mu ~ normal(150,100);
  sigma ~ uniform(0,100);
  pi ~ dirichlet(rep_vector(1,K));
  // likelihood
  for (n in 1:N){
    indicators[n] ~ multinomial(pi)
    y[n] ~ normal(mu[indicators[n], sigma[indicators[n]])
  }
}
