package matchings

import blang.validation.ExactInvarianceTest
import org.junit.Test
import blang.validation.Instance

class ExactInvarianceTestComplicatedModel {
  
  val static ComplicatedModel complicatedModel = new ComplicatedModel.Builder()
    .setNumPlayers(3)
    .setNumGames(2) 
    .build
  val static test = new ExactInvarianceTest => [
    nPosteriorSamplesPerIndep = 1_000
  ]
  val static instance = new Instance(
    complicatedModel,
    // Test functions:
    [means.get(0).doubleValue],
    [obs.get(0,0)],
    [means.get(permutations.get(0).getConnections.get(0)).doubleValue]  
  )
  
  @Test
  def void testKSInvariance() {
    test.add(instance)
    test.check
  }
  
}