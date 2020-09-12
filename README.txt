====================================================
     REPRODUCTION MATERIAL INFORMATION
====================================================


run.sh
====================================================
This script is an extension of the replication script
which can be run from within the 
'reproduction_material' directory.

It begins by extracting and installing the blangSDK
and blangCLI tools and proceeds to run all the models
in reproduction_material/example and 
reproduction_material/others.

Note that this must be run with 'source run.sh' to
properly set up the blangCLI path.


examples
====================================================
This subdirectory holds the following models, as 
well as their corresponding datasets, which are used 
in the manuscript to display results:

- Doomsday.bl
- MixtureModel.bl
- CompositeModel.bl
- Rockets.bl
- PhylogeneticTree.bl
- SpikeSlabClassification.bl

In order to run an individual model and with 
arguments different to those used within the 
manuscript, simple navigate into the subdirectory,
and use the blangCLI as shown in the paper.

'reproduction_material/example/' is the Blang 
project root directory, and any CLI commands should
be ran from there.



others
====================================================
This directory contains the Blang files for all 
other code presented within the manuscript. This 
subdirectory also serves as a demo for a gradle 
project setup and can be imported into the eclipse
IDE.

While the run.sh script executes all programs within
this directory, the command to individually run the
models is as follows:

# Setup and build project (only needed if run.sh 
has not been used previously)
'cd others'
'./gradlew clean'
'./gradlew installDist'
'./gradlew eclipse'

# Bring up list of models
'build/install/others/bin/others'

# Run the IsingExample model
'build/install/others/bin/others ising'

# Run tests
'./gradlew test'

The parameters for the model are stored in the 
following file:
'others/src/main/resources/others/models.csv'




Additional models
====================================================
Additional models can be created within 
reproduction_material/example

Any models created there can be run as such:
`cd example`
`blang --model packageName.ModelName`




HELP COMMAND
====================================================
For a full list of available arguments for a given 
model, such as the Doomsday model, call the 
following from within :
`blang --model jss.Doomsday --help`
