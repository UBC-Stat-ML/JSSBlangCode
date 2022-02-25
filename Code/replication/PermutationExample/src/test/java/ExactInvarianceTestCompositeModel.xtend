package jss.perm

import blang.validation.ExactInvarianceTest
import org.junit.Test
import blang.validation.Instance
import static blang.types.StaticUtils.*

class ExactInvarianceTestCompositeModel {
  
  val static n = 3
  val static CompositeModel compositeModel = new CompositeModel.Builder()
    .setPermutation(new Permutation(n))
    .setY(latentRealList(n))
    .build
  val static test = new ExactInvarianceTest => [
    nPosteriorSamplesPerIndep = 1000
  ]
  val static instance = new Instance(
    compositeModel,
    // Test functions:
    [y.get(0).doubleValue],
    [y.get(1).doubleValue],
    [y.get(2).doubleValue],
    [permutation.getConnections.get(0).doubleValue],
    [permutation.getConnections.get(1).doubleValue],  
    [permutation.getConnections.get(2).doubleValue]  
  )
  
  @Test
  def void testKSInvariance() {
    test.add(instance)
    test.check
  }
  
}
