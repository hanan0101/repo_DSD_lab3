#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Thu Nov 14 16:28:16 +03 2024
# SW Build 2552052 on Fri May 24 14:47:09 MDT 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xelab -wto e8fc1b621ad84d29a77de389549127f3 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_incrementer_circut_Rom_behav xil_defaultlib.tb_incrementer_circut_Rom xil_defaultlib.glbl -log elaborate.log"
xelab -wto e8fc1b621ad84d29a77de389549127f3 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_incrementer_circut_Rom_behav xil_defaultlib.tb_incrementer_circut_Rom xil_defaultlib.glbl -log elaborate.log

