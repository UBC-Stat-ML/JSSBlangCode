package jss.perm

import blang.validation.ExactInvarianceTest
import org.junit.Test
import blang.validation.Instance

class ExactInvarianceTestCompositeModel {
  
  val static jss.perm.CompositeModel compositeModel = new jss.perm.CompositeModel.Builder()
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
