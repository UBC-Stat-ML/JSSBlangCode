=== REPRODUCTION MATERIAL README ===


file: run.sh
====================================================
This script is an extension of the replication script which can be run from within the 'reproduction_material' directory.
It begins by extracting and installing the blangSDK and CLI tools, and proceeds to run all the models in reproduction_material/example.
Note that this must be run with `source run.sh` to properly set up the blang CLI path.


directory: example
====================================================
This subdirectory holds the following models as well as their corresponding datasets, which are used in the manuscript to display results:

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

Models with * require the programming language R, and packages dplyr and ggplot2.
Models with ** require internet connection.

In order to run an individual model and with arguments different to those used within the manuscript, simply navigate into the example directory and use the CLI as shown in the paper.
'reproduction_material/example/' is the Blang project root directory, and any CLI commands should be ran from there.


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
