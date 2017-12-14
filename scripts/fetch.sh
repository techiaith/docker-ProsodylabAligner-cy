#!/bin/bash

mkdir -p paldaruo
cd paldaruo
git -c http.sslVerify=false clone --branch v4.0 --depth 1 https://git.techiaith.bangor.ac.uk/Data-Porth-Technolegau-Iaith/Corpws-Paldaruo.git

mv -v Corpws-Paldaruo/* .
rm -rf Corpws-Paldaruo

mv audio/wav .
rmdir audio

cd wav
unzip \*.zip
rm *.zip 
cd -

# downsample to 16kHz
source scripts/downsample.sh paldaruo
