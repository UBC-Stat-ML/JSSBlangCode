=== REPLICATION MATERIAL README ===


file: run.sh
====================================================
This script should be run from the 'replication' directory.
It begins by extracting and installing the blangSDK and CLI tools, and proceeds to run all models in replication/example.
Note that this must be run with `source run.sh` to properly configure the blang CLI path.


directory: example
====================================================
This subdirectory holds the following models and corresponding datasets, which are used in the manuscript to display results:

- Doomsday.bl
- MixtureModel.bl *
- MixtureModelPlated.bl
- CompositeModel.bl
- Rockets.bl
- PhylogeneticTree.bl **
- SpikeSlabClassification.bl *
- and various other code snippets within the paper:
  - ContinuousUniformExample.bl
  - ExponentialExample.bl
  - IntMixtureExample.bl
  - IsingExample.bl
  - LogPotentialExample.bl
  - MarkovChainExample.bl
  - PlatedMatrixExample.bl
  - PoissonPoissonMixtureExample.bl

Models with * require the programming language R with packages dplyr and ggplot2.
Models with ** require internet connection.


directory: PermutationExample
====================================================
The PermutationExample directory contains source files for both the model and tests.
To run the tests, a gradle project must be setup:
```
  mv PermutationExample tmp
  create-blang-gradle-project --name PermutationExample
  rm -r PermutationExample/src
  mv tmp/src PermutationExample
  cd PermutationExample
  ./gradlew clean
  ./gradlew test
```
