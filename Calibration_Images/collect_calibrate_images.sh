#!/bin/bash

clear

# delete and clear all the images
rm -rf 1
rm -rf 2
rm -rf 3
rm -rf 4
rm -rf 5

# check if the position is ready
mvid_stream -i 1600 -d 10.14.1.100 -2

mkdir 1
mkdir 1/Right
mkdir 1/Left

puma3_save_right
mv mvid* 1/Right/

puma3_save_left
mv mvid* 1/Left/

# check if the position is ready
mvid_stream -i 1600 -d 10.14.1.100 -2

mkdir 2
mkdir 2/Right
mkdir 2/Left

puma3_save_right
mv mvid* 2/Right/

puma3_save_left
mv mvid* 2/Left/

# check if the position is ready
mvid_stream -i 1600 -d 10.14.1.100 -2

mkdir 3
mkdir 3/Right
mkdir 3/Left

puma3_save_right
mv mvid* 3/Right/

puma3_save_left
mv mvid* 3/Left/

# check if the position is ready
mvid_stream -i 1600 -d 10.14.1.100 -2

mkdir 4
mkdir 4/Right
mkdir 4/Left

puma3_save_right
mv mvid* 4/Right/

puma3_save_left
mv mvid* 4/Left/

# check if the position is ready
mvid_stream -i 1600 -d 10.14.1.100 -2

mkdir 5
mkdir 5/Right
mkdir 5/Left

puma3_save_right
mv mvid* 5/Right/

puma3_save_left
mv mvid* 5/Left/
