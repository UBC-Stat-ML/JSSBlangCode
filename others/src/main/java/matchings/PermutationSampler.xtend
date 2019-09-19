package matchings

import java.util.Collections
import java.util.List
import bayonet.distributions.Random
import blang.core.LogScaleFactor
import blang.distributions.Generators
import blang.mcmc.ConnectedFactor
import blang.mcmc.SampledVariable
import blang.mcmc.Sampler
import briefj.collections.UnorderedPair

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

		var UnorderedPair<Integer, Integer> pair = Generators::distinctPair(rand, permutation.componentSize()) 
		var double logDensityBefore = logDensity() 
		Collections::swap(permutation.getConnections(), pair.getFirst(), pair.getSecond()) 
		var double logDensityAfter = logDensity() 
		var double acceptPr = Math::min(1.0, Math::exp(logDensityAfter - logDensityBefore)) 
		if (Generators::bernoulli(rand, acceptPr)) {} 
		else { 
		    Collections::swap(permutation.getConnections(), pair.getFirst(), pair.getSecond())
		}
		
	}
def double logDensity() {
		var double sum=0.0 
		for (LogScaleFactor f : numericFactors) sum+=f.logDensity() 
		return sum 
	}
}
