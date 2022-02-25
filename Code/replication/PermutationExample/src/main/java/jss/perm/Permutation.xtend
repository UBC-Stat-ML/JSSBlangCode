package jss.perm

import org.eclipse.xtend.lib.annotations.Data
import blang.mcmc.Samplers
import java.util.Random
import static java.util.Collections.sort
import static java.util.Collections.shuffle
import java.util.List

/**
 * A permutation or equivalently, a bipartite perfect 
 * matching.
 * 
 * The annotation "@Samplers" links the data type with the appropriate sampler. 
 * 
 * The annotation "@Data" is not related to data in the statistical 
 * sense but rather read as 'data class', meaning that .equals, .hashcode 
 * are automatically implemented, as well as other nice defaults 
 * (see the xtend documentation for details). 
 */
@Samplers(PermutationSampler)
@Data class Permutation {
  /**
   * Assume the vertices are indexed 0, 1, ..., N in the first bipartite component, and 
   * also 0, 1, 2, .., N in the second bipartite component. 
   * 
   * For vertex i in the first component, connections.get(i) 
   * give the index in the second bipartite component. 
   */
  val List<Integer> connections
  
  /**
   * Initialize to the identity permutation.
   */
  new (int componentSize) {
    connections = (0 ..< componentSize).toList
  }
  
  /**
   * The number of vertices in each of the two bipartite components.
   */
  def int componentSize() { 
    return connections.size
  }
  
  override String toString() { 
    return connections.toString
  }
  
  /**
   * Sample an independent uniform permutation in place.
   */
  def void sampleUniform(Random random) { 
    sort(connections) // sort first to make independent from the current config. 
    shuffle(connections, random)
  }
}
