#!/bin/bash

# Requires a UNIX-compatible environment running bash, and git software.
# MixtureModel and SpikeSlabClassification examples require R with packages "dplyr" and "ggplot2" if DefaultPostProcessor is used.


# Unpack SDK and setup the CLI
echo "Setting up the CLI"
tar -xzvf blangSDK-2.10.3.tar.gz
cd blangSDK-2.10.3
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
echo "Running Doomsday"
read -n 1 -s -r -p "Press any key to continue."
echo
blang --model jss.Doomsday --model.rate 1.0 --model.y 1.2 --model.z NA
echo


echo
echo "Running MixtureModel"
echo "By default, the DefaultPostProcessor is used:"
echo "R with packages 'dplyr' and 'ggplot2' is required."
read -n 1 -s -r -p "Press any key to continue"
echo
blang --model jss.gmm.MixtureModel \
  --model.y file data/obs1.txt \
  --engine PT \
  --engine.nChains 36 \
  --engine.nScans 30000 \
  --postProcessor DefaultPostProcessor


echo
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
	--model.rockets.name Rocket


echo
echo "Running PhylogeneticTree"
echo "Internet connection required to demonstrate"
echo "importing third party libraries via GitHub"
read -n 1 -s -r -p "Press any key to continue."
echo
blang --model jss.phylo.PhylogeneticTree \
   --model.observations.file data/primates.fasta \
   --model.observations.encoding DNA


echo
echo "Running SpikeSlabClassification"
echo "By default, the DefaultPostProcessor is used:"
echo "R with packages 'dplyr' and 'ggplot2' is required."
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
echo "Running ContinuousUniformExample"
read -n 1 -s -r -p "Press any key to continue."
echo
blang --model jss.others.ContinuousUniformExample --model.min 0 \
      --model.max 1 \
      --model.realization NA

echo
echo "Running ExponentialExample"
read -n 1 -s -r -p "Press any key to continue."
echo
blang --model jss.others.ExponentialExample --model.rate 1 \
      --model.realization NA

echo
echo "Running IsingExample"
read -n 1 -s -r -p "Press any key to continue."
echo
blang --model jss.others.IsingExample


echo
echo "Running MarkovChainExample"
read -n 1 -s -r -p "Press any key to continue."
echo
blang --model jss.others.MarkovChainExample


echo
echo "Running PlatedMatrixExample"
read -n 1 -s -r -p "Press any key to continue."
echo
blang --model jss.others.PlatedMatrixExample \
      --model.dims.maxSize 3 \
      --model.replicates.maxSize 5

echo
echo "Running PoissonPoissonMixture"
read -n 1 -s -r -p "Press any key to continue."
echo
blang --model jss.others.PoissonPoissonMixtureExample


echo
echo "Running Tests for CompositeModel"
read -n 1 -s -r -p "Press any key to continue."
echo
cd ../
mv PermutationExample tmp
create-blang-gradle-project --name PermutationExample
rm -r PermutationExample/src
mv tmp/src PermutationExample/
cd PermutationExample
./gradlew clean
./gradlew test
