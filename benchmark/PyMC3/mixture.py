import pymc3 as pm
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

if __name__ == "__main__":
    data = pd.read_csv("../data/mixture_data.csv", header=None)[0]
    K = 2

    with pm.Model() as mixture:
        pi = pm.Dirichlet('pi', a=np.ones(K))
        indicator = pm.Categorical('indicator', p=pi, shape=data.size)
        means = pm.Normal('means', mu=150, sigma=100, shape=K)
        sds = pm.Uniform('sds', lower=0, upper=100, shape=K)
        y = pm.Normal('y', mu=means[indicator], sd=sds[indicator], observed=data)

        trace = pm.sample(draws=1000, random_seed=1)
        results = pm.trace_to_dataframe(trace)
        for header in list(results):
            output = results.loc[:,header]
            output.to_csv("mixture_" + header + ".csv", index_label="sample", header=["value"])
        pm.plot_posterior(trace.get_values("means"))
        plt.show()


