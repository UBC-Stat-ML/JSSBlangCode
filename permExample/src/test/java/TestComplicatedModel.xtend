package jss.perm

import static blang.types.StaticUtils.*
import blang.runtime.SampledModel
import blang.validation.DiscreteMCTest
import com.rits.cloning.Cloner
import org.junit.Test
import static org.apache.commons.math3.util.CombinatoricsUtils.factorial
import static java.lang.Math.pow
import blang.runtime.internals.objectgraph.GraphAnalysis
import blang.runtime.Observations
import blang.types.ExtensionUtils

class TestComplicatedModel {
  
  // Create some fake observations.
  val static obs = {
    val result = latentMatrix(2, 3)
    ExtensionUtils.setTo(result, 
      fixedMatrix(#[
        #[-4.4, 1.7, 5.4],
        #[-0.3, 6.8, -5.0]
        ])
    )
    result
  }

  // Instantiating our model with a builder.
  // To apply linear algebra tests, we need a fully-discrete model:
  // thus we fix our mean parameters.
  val static ComplicatedModel complicatedModel = new ComplicatedModel.Builder()
    .setNumPlayers(3)
    .setNumGames(2)
    .setMeans(fixedRealList(-5.0, 0.0, 5.0))
    .setObs(obs)
    .build

  // Turn our synthetic data into type Observation, as required by Blang's architecture
  val static observations = {
    val Observations result = new Observations
    result.markAsObserved(obs)
    result
  }

  // Instantiate a DiscreteMCTest
  val static DiscreteMCTest test = 
    new DiscreteMCTest(
      new SampledModel(new GraphAnalysis(complicatedModel, observations)),
      [
        val ComplicatedModel clustering = model as ComplicatedModel
        return new Cloner().deepClone(clustering.permutations)
      ]
    ) 

  // Now we may run multiple tests based on this model: 
  // 1) check the state space size of our list of permutations.
  // 2) check the sampler is indeed invariant to our posterior; this is possible
  //    because we are working with a fully-discrete (enumerable) space.
  // 3) check the irreducibility of our sampler.


  @Test 
  def void stateSize() {
    test.verbose = true
    test.checkStateSpaceSize(pow(factorial(3), 2) as int)
  }
  
  @Test
  def void invariance() {
    test.verbose = true
    test.checkInvariance
  }
  
  @Test
  def void irreducibility() {
    test.verbose = true
    test.checkIrreducibility
  }
  

}
