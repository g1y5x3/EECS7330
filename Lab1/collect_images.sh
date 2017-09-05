#!/bin/bash

clear

rm -rf Right

rm -rf Left

mkdir Right

mkdir Left

puma3_save_right

mv mvid* Right/

puma3_save_left

mv mvid* Left/
