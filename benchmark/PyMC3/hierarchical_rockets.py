import numpy as np
import pymc3 as pm
import pandas as pd
import sys
import matplotlib.pyplot as plt

if __name__ == "__main__":
    rockets_data = pd.read_csv("data/rockets.csv")

    with pm.Model() as rockets_model:
        a = pm.Gamma('alpha', alpha=1, beta=1)
        b = pm.Gamma('beta' , alpha=1, beta=1)
        pi = pm.Beta('pi', alpha=a, beta=b)

        n_fails = pm.Binomial('n_fails', n=n_launches, p=pi, observed=failure_counts)
        incidents = pm.Bernoulli('incidents',
                                 p=logistic(intercept + slope * temperatures),
                                 shape=incidents_data.size,
                                 observed=incidents_data)

        trace = pm.sample(draws=num_draws, chains=num_chains, random_seed=sampling_seed)
        results = pm.trace_to_dataframe(trace)
        for header in list(results):
            output = results.loc[:,header]
            output.to_csv("challenger_" + header + "_" + sys.argv[1] + "_" + sys.argv[2] + "_" + sys.argv[3] +
                          ".csv", index_label="sample", header=["value"])
        #  pm.plot_posterior(trace)
        #  plt.show()


