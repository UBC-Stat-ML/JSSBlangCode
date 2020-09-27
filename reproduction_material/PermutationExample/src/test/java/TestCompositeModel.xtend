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

class TestCompositeModel {
  
  // Create some fake observations.
  val static y = fixedRealList(2.1, -0.3, 0.8)
  // Instantiating our model with a builder.
  // To apply linear algebra tests, we need a fully-discrete model:
  val static CompositeModel compositeModel = new CompositeModel.Builder()
    .setY(y)
    .setPermutation(new Permutation(y.size))
    .build

  // Turn our synthetic data into type Observation, as required by Blang's architecture
  val static observations = {
    val Observations result = new Observations
    result.markAsObserved(y)
    result
  }

  // Instantiate a DiscreteMCTest
  val static DiscreteMCTest test = 
    new DiscreteMCTest(
      new SampledModel(new GraphAnalysis(compositeModel, observations)),
      [
        val CompositeModel cm = model as CompositeModel
        return new Cloner().deepClone(cm.permutation)
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
    test.checkStateSpaceSize(factorial(y.size) as int)
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
