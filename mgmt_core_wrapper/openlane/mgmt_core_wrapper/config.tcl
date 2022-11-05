# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) mgmt_core_wrapper
set ::env(DESIGN_IS_CORE) 1

set ::env(PDK) "gf180mcuC"
set ::env(STD_CELL_LIBRARY) "gf180mcu_sc7_hv"

set ::env(ROUTING_CORES) 	"160"
set ::env(RUN_KLAYOUT) 		0
set ::env(CLOCK_PORT) 		"core_clk"
#set ::env(CLOCK_NET) ""
set ::env(CLOCK_PERIOD) 	"45"

## Synthesis
set ::env(SYNTH_STRATEGY) 	"AREA 0"
set ::env(SYNTH_MAX_FANOUT) 8

#set ::env(CLOCK_TREE_SYNTH) 0
##set ::env(BASE_SDC_FILE) $script_dir/base.sdc 

## Floorplan
set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg
set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 2350 1000"


set ::env(FP_IO_VEXTEND) 2
set ::env(FP_IO_HEXTEND) 2

set ::env(FILL_INSERTION) 		1
set ::env(TAP_DECAP_INSERTION) 	1
set ::env(FP_TAPCELL_DIST) 30

# set ::env(GLB_RT_OBS) "met5 2317.34500 796.94500 2317.77000 798.49500"

## PDN
#set ::env(PDN_CFG) $script_dir/pdn.tcl
#set ::env(FP_PDN_CORE_RING) 0
#set ::env(FP_PDN_CHECK_NODES) 0
# set ::env(FP_PDN_UPPER_LAYER) {Metal5}
# set ::env(FP_PDN_LOWER_LAYER) {Metal1}
## PDN
set ::env(FP_PDN_CORE_RING) 1
set ::env(FP_PDN_VPITCH) 50
set ::env(FP_PDN_HPITCH) 130

set ::env(FP_PDN_VWIDTH) 1.6
set ::env(FP_PDN_CORE_RING_VWIDTH) 1.6

# set ::env(FP_PDN_CHECK_NODES) 0	
# ir_drop_analyser can't find Metal3 resistance
set ::env(FP_PDN_IRDROP) 0
set ::env(FP_PDN_ENABLE_GLOBAL_CONNECTIONS) 1


set ::env(GLB_RT_ADJUSTMENT) 0.18


#set ::env(FP_PDN_VPITCH) 50
#set ::env(FP_PDN_HPITCH) 130

#set ::env(FP_PDN_CHECK_NODES) 0
#set ::env(FP_PDN_IRDROP) 0

#set ::env(FP_PDN_ENABLE_RAILS) 0

#set ::env(FP_PDN_HORIZONTAL_HALO) -6
#set ::env(FP_PDN_VERTICAL_HALO) 25

#set ::env(FP_PDN_HOFFSET) 60 
#set ::env(FP_PDN_HWIDTH) 3.2


set ::env(BOTTOM_MARGIN_MULT) 3
set ::env(TOP_MARGIN_MULT) 3
set ::env(RIGHT_MARGIN_MULT) 10
set ::env(LEFT_MARGIN_MULT) 10


## Placement
set ::env(PL_TARGET_DENSITY) 0.55

set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 1
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 1

## Routing
set ::env(GLB_RT_ADJUSTMENT) 0
#set ::env(GLB_RT_L2_ADJUSTMENT) 0.31
#set ::env(GLB_RT_L3_ADJUSTMENT) 0.31
#set ::env(GLB_RT_L4_ADJUSTMENT) 0.21
#set ::env(GLB_RT_L5_ADJUSTMENT) 0.21
#set ::env(GLB_RT_L6_ADJUSTMENT) 0.1
set ::env(GLB_RT_ALLOW_CONGESTION) 1
set ::env(GLB_RT_OVERFLOW_ITERS) 200

#set ::env(GLB_RT_MINLAYER) 2
#set ::env(GLB_RT_MAXLAYER) 6

#set ::env(GLB_RT_OBS) 

set ::env(GLB_RESIZER_TIMING_OPTIMIZATIONS) 0

set ::env(QUIT_ON_TIMING_VIOLATIONS) 		0
set ::env(RUN_SPEF_EXTRACTION) 				0

set ::env(QUIT_ON_ILLEGAL_OVERLAPS) 0

## DRC
#set ::env(MAGIC_DRC_USE_GDS) 0
#set ::env(QUIT_ON_MAGIC_DRC) 0
# set ::env(RUN_MAGIC) {0}
# set ::env(MAGIC_GENERATE_GDS) 0
# set ::env(RUN_MAGIC_DRC) {0}
# set ::env(MAGIC_GENERATE_MAGLEF) 0
# set ::env(RUN_LVS) {0}
# set ::env(RUN_KLAYOUT) {0}
# set ::env(RUN_KLAYOUT_XOR) {0}

## LVS
set ::env(QUIT_ON_LVS_ERROR) 0

## Diode Insertion
set ::env(DIODE_INSERTION_STRATEGY) 		4

set ::env(VERILOG_FILES) "\
	$script_dir/../../verilog/rtl/defines.v\
	$script_dir/../../verilog/rtl/mgmt_core_wrapper.v\
	$script_dir/../../verilog/rtl/mgmt_core.v\
	$script_dir/../../verilog/rtl/VexRiscv_MinDebugCache.v\
	$script_dir/../../verilog/rtl/sram.v\
	$script_dir/../../verilog/rtl/GF180_RAM_512x32.v"

set ::env(VERILOG_FILES_BLACKBOX) "\
	$script_dir/../../verilog/rtl/defines.v\
	$::env(PDK_ROOT)/$::env(PDK)/libs.ref/gf180mcu_sram/verilog/GF018_5VGreen_SRAM_1P_512x8M8WM1.v"
	

set ::env(EXTRA_LEFS) "\
	$script_dir/../../lef/GF018_5VGreen_SRAM_1P_512x8M8WM1.lef"
set ::env(EXTRA_GDS_FILES) "\
    $::env(PDK_ROOT)/$::env(PDK)/libs.ref/gf180mcu_sram/gds/GF018_5VGreen_SRAM_1P_512x8M8WM1.gds"
set ::env(EXTRA_LIBS) "\
    $::env(PDK_ROOT)/$::env(PDK)/libs.ref/gf180mcu_sram/liberty/GF018_5VGreen_SRAM_1P_512x8M8WM1_tt_1p8v_25c.lib"

## Internal Macros
set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro_placement.cfg

#set ::env(EXTRA_GDS_FILES) "\
#	$script_dir/../../gds/mgmt_core.gds
#	$script_dir/../../gds/DFFRAM.gds"

set ::env(QUIT_ON_MISMATCHES) 0

set ::env(FP_PDN_MACRO_HOOKS) "\
  core.sram.ram512x32.RAM00 VDD VSS
  core.sram.ram512x32.RAM02 VDD VSS
  core.sram.ram512x32.RAM01 VDD VSS
  core.sram.ram512x32.RAM03 VDD VSS
  "

set ::env(PDN_CFG) $script_dir/pdn.tcl

