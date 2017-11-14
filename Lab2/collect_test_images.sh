#!/bin/bash

# clear

# delete and clear all the images
rm -rf test

# check if the position is ready
mvid_stream -i 1600 -d 10.14.1.100 -2

mkdir test
mkdir test/Right
mkdir test/Left

puma3_save_right
mv mvid* test/Right/
cp test/Right/mvid_save00000.ppm test_right.ppm

puma3_save_left
mv mvid* test/Left/
cp test/Left/mvid_save00000.ppm test_left.ppm