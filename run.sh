#!/bin/bash

# Requires a UNIX-compatible environment running bash, and git software.

# mkdir RUN_DIR
# cd RUN_DIR



# Unpack SDK and setup the CLI
echo "Setting up the CLI"
tar -xzvf blangSDK-2.10.0.tar.gz
cd blangSDK-2.10.0
echo
source setup-cli.sh
echo
cd ../example

echo "================================================="
echo "Running Models in the examples subdirectory "
echo "================================================="
read -n 1 -s -r -p "Press any key to continue."
echo


echo
# Run the Doomsday example
echo "Running Doomsday"
read -n 1 -s -r -p "Press any key to continue."
echo
blang --model jss.Doomsday --model.rate 1.0 --model.y 1.2 --model.z NA
echo


echo "Running MixtureModel"
read -n 1 -s -r -p "Press any key to continue"
echo
blang --model jss.gmm.MixtureModel \
  --model.y file data/obs1.txt \
  --engine PT \
  --engine.nChains 36 \
  --engine.nScans 30000 \
  --postProcessor DefaultPostProcessor


echo "Running Permutation example"
read -n 1 -s -r -p "Press any key to continue"
echo
blang --model jss.perm.CompositeModel \
  --engine PT \
  --engine.nChains 12 \
  --engine.nScans 5000



echo
echo "Running Rocket"
read -n 1 -s -r -p "Press any key to continue."
echo
blang --model jss.hier.Rocket \
       	--model.data data/rockets.csv \
       	--model.countries.name Country \
	--model.rockets.name Rocket \


echo
echo "Running PhylogeneticTree"
read -n 1 -s -r -p "Press any key to continue."
echo
blang --model jss.phylo.PhylogeneticTree \
   --model.observations.file data/primates.fasta \
   --model.observations.encoding DNA 


echo
echo "Running SpikeSlabClassification"
read -n 1 -s -r -p "Press any key to continue."
echo
blang --model jss.glms.SpikeSlabClassification \
   --model.data data/titanic/titanic-covariates.csv \
   --model.instances.name Name \
   --model.instances.maxSize 200 \
   --model.labels.dataSource data/titanic/titanic.csv \
   --model.labels.name Survived \
   --engine PT \
   --engine.nChains 12 \
   --postProcessor DefaultPostProcessor


echo
echo

echo "================================================="
echo "Now swapping to run models in subdirectory others "
echo "================================================="
read -n 1 -s -r -p "Press any key to continue."

cd ../others

echo

echo "================================================="
echo "Setting up gradle project"
echo "================================================="
echo
./gradlew clean
./gradlew installDist


models=(uniform exponential ising markov-chain plated-matrix poisson-mixture)

echo
echo

echo "================================================="
echo "================================================="
echo
echo " Available models are will be listed below. Use  "
echo " command: 'build/install/others/bin/others name  "
echo
echo "================================================="
echo "================================================="
read -n 1 -s -r -p "Press any key to continue."

echo
for item in ${models[@]}
do
  echo
  echo
  echo "================================================="
  echo "Running Model " $item
  echo "================================================="
  read -n 1 -s -r -p "Press any key to continue."
  echo
  build/install/others/bin/others $item
done

echo "All models ran successfully."

echo
echo

echo "================================================="
echo "Now running:"
echo
echo "1. ExactInvarianceTestCompositeModel.xtend"
echo "2. TestCompositeModel.xtend "
echo "================================================="
read -n 1 -s -r -p "Press any key to continue."
echo

echo
./gradlew test
