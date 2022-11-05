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
# User config
set ::env(DESIGN_NAME) GF180_RAM_512x32
set ::env(DESIGN_IS_CORE) 1

set ::env(PDK) "gf180mcuC"
set ::env(STD_CELL_LIBRARY) "gf180mcu_sc7_hv"

set ::env(ROUTING_CORES) 8
set ::env(RUN_KLAYOUT) 0

set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 3000 3000"

set ::env(FP_PIN_ORDER_CFG) $::env(DESIGN_DIR)/pin_order.cfg

# Change if needed
set ::env(VERILOG_FILES) "\
	$script_dir/../../verilog/rtl/GF180_RAM_512x32.v"
set ::env(VERILOG_FILES_BLACKBOX) "\
    $script_dir/../../sram/verilog/GF018_5VGreen_SRAM_1P_512x8M8WM1.v"
set ::env(EXTRA_LEFS) "\
    $script_dir/../../sram/lef/GF018_5VGreen_SRAM_1P_512x8M8WM1.lef"
set ::env(EXTRA_GDS_FILES) "\
    $script_dir/../../sram/gds/GF018_5VGreen_SRAM_1P_512x8M8WM1.gds"
set ::env(EXTRA_LIBS) "\
    $script_dir/../../sram/lib/GF018_5VGreen_SRAM_1P_512x8M8WM1_tt_1p8v_25c.lib"

set ::env(CLOCK_PERIOD) "25"
set ::env(CLOCK_PORT) "CLK"

## Synthesis
set ::env(CLOCK_TREE_SYNTH) 1
set ::env(SYNTH_READ_BLACKBOX_LIB) 1

# set ::env(FP_CORE_UTIL) 45
# set ::env(SYNTH_MAX_FANOUT) 6
# set ::env(PL_TARGET_DENSITY) 0.60

## Routing

set ::env(RT_MIN_LAYER) {Metal2}
set ::env(RT_MAX_LAYER) {Metal5}

## Diode Insertion
set ::env(DIODE_INSERTION_STRATEGY) 4


set ::env(QUIT_ON_MISMATCHES) 0

## Internal Macros
set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro_placement.cfg

## PDN
set ::env(PDN_CFG) $script_dir/pdn_cfg.tcl
set ::env(FP_PDN_CORE_RING) 0
set ::env(FP_PDN_CHECK_NODES) 0
# set ::env(FP_PDN_UPPER_LAYER) {Metal5}
# set ::env(FP_PDN_LOWER_LAYER) {Metal1}
set ::env(FP_PDN_ENABLE_GLOBAL_CONNECTIONS) 1


set ::env(GLB_RT_ADJUSTMENT) 0.18

# ir_drop_analyser can't find Metal3 resistance
set ::env(FP_PDN_IRDROP) 0

# Enable all optimizations
set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 1
set ::env(GLB_RESIZER_TIMING_OPTIMIZATIONS) 1
# Diode insertion strategy number 4 for gf-180mcu
set ::env(DIODE_INSERTION_STRATEGY) 4

# Skip steps due to incomplete pdk
set ::env(QUIT_ON_TIMING_VIOLATIONS) 0
set ::env(RUN_SPEF_EXTRACTION) 0
# set ::env(RUN_MAGIC) {0}
# set ::env(MAGIC_GENERATE_GDS) 0
# set ::env(RUN_MAGIC_DRC) {0}
# set ::env(MAGIC_GENERATE_MAGLEF) 0
# set ::env(RUN_LVS) {0}
# set ::env(RUN_KLAYOUT) {0}
# set ::env(RUN_KLAYOUT_XOR) {0}
