package jss.perm

import java.util.List
import bayonet.distributions.Random
import blang.core.LogScaleFactor
import blang.mcmc.ConnectedFactor
import blang.mcmc.SampledVariable
import blang.mcmc.Sampler
import static java.lang.Math.exp
import static java.lang.Math.min
import static extension java.util.Collections.swap

/** 
 * Each time a Permutation is encountered in a Blang model, 
 * this sampler will be instantiated. 
 */
class PermutationSampler implements Sampler {
/** 
 * This field will be populated automatically with the 
 * permutation being sampled. 
 */
@SampledVariable Permutation permutation
/** 
 * This will contain all the elements of the prior or likelihood 
 * (collectively, factors), that depend on the permutation being 
 * resampled. 
 */
@ConnectedFactor List<LogScaleFactor> numericFactors

override void execute(Random rand) {
	val n = permutation.componentSize
	val i = rand.nextInt(n)
	val j = rand.nextInt(n)
	
	val log_pi_current = logDensity()
	permutation.connections.swap(i,j)
	val log_pi_new = logDensity()
	
	val accept_prob = min(1.0, exp(log_pi_new - log_pi_current))
	val accept_proposal = rand.nextBernoulli(accept_prob)
	if (!accept_proposal) {
		permutation.connections.swap(i, j)
	}
}

def double logDensity() {
		var double sum=0.0 
		for (LogScaleFactor f : numericFactors) sum+=f.logDensity() 
		return sum 
	}
}
