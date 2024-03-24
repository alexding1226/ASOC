//  Catapult Ultra Synthesis 2023.2/1059873 (Production Release) Mon Aug  7 10:54:31 PDT 2023
//  
//          Copyright (c) Siemens EDA, 1996-2023, All Rights Reserved.
//                        UNPUBLISHED, LICENSED SOFTWARE.
//             CONFIDENTIAL AND PROPRIETARY INFORMATION WHICH IS THE
//                   PROPERTY OF SIEMENS EDA OR ITS LICENSORS.
//  
//  Running on Linux r12016@cad40 3.10.0-1160.el7.x86_64 x86_64 aol
//  
//  Package information: SIFLIBS v26.2_0.0, HLS_PKGS v26.2_0.0, 
//                       SIF_TOOLKITS v26.2_0.0, SIF_XILINX v26.2_0.0, 
//                       SIF_ALTERA v26.2_0.0, CCS_LIBS v26.2_0.0, 
//                       CDS_PPRO v2023.1, CDS_DesignChecker v2023.2, 
//                       CDS_OASYS v21.1_3.1, CDS_PSR v23.1_1.18, 
//                       DesignPad v2.78_1.0
//  
solution new -state initial
solution options defaults
solution options set /OnTheFly/VthAttributeType cell_lib
solution options set /Input/TargetPlatform x86_64
solution options set /Output/GenerateCycleNetlist false
solution file add ./top_tb.cpp -type C++ -exclude true
solution file add ./top.h -type CHEADER
solution file add ./fir.h -type CHEADER
solution file add ./decimator.h -type CHEADER
directive set -PIPELINE_RAMP_UP true
directive set -PROTOTYPING_ENGINE oasys
directive set -CLUSTER_TYPE combinational
directive set -CLUSTER_FAST_MODE false
directive set -CLUSTER_RTL_SYN false
directive set -CLUSTER_OPT_CONSTANT_INPUTS true
directive set -CLUSTER_ADDTREE_IN_COUNT_THRESHOLD 0
directive set -CLUSTER_ADDTREE_IN_WIDTH_THRESHOLD 0
directive set -ROM_THRESHOLD 64
directive set -PROTOTYPE_ROM true
directive set -CHARACTERIZE_ROM false
directive set -OPT_CONST_MULTS use_library
directive set -ON_THE_FLY_PROTOTYPING false
directive set -CLOCK_OVERHEAD 20.000000
directive set -RESET_CLEARS_ALL_REGS use_library
directive set -TRANSACTION_SYNC ready
directive set -START_FLAG {}
directive set -READY_FLAG {}
directive set -DONE_FLAG {}
directive set -TRANSACTION_DONE_SIGNAL true
directive set -STALL_FLAG false
directive set -STALL_FLAG_SV off
directive set -IDLE_SIGNAL {}
directive set -ARRAY_SIZE 1024
directive set -CHAN_IO_PROTOCOL use_library
directive set -IO_MODE super
directive set -UNROLL no
directive set -REALLOC true
directive set -MUXPATH true
directive set -TIMING_CHECKS true
directive set -ASSIGN_OVERHEAD 0
directive set -REGISTER_SHARING_LIMIT 0
directive set -REGISTER_SHARING_MAX_WIDTH_DIFFERENCE 8
directive set -SAFE_FSM false
directive set -NO_X_ASSIGNMENTS true
directive set -REG_MAX_FANOUT 0
directive set -FSM_BINARY_ENCODING_THRESHOLD 64
directive set -FSM_ENCODING none
directive set -LOGIC_OPT false
directive set -MEM_MAP_THRESHOLD 32
directive set -REGISTER_THRESHOLD 256
directive set -MERGEABLE true
directive set -SPECULATE true
directive set -DESIGN_GOAL area
go new
go analyze
go compile
solution library add nangate-45nm_beh -- -rtlsyntool DesignCompiler -vendor Nangate -technology 045nm
solution library add ccs_sample_mem
go libraries
directive set -CLOCKS {clk {-CLOCK_PERIOD 10.0 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 5.0 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND sync -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_ACTIVE high}}
go assembly
directive set /top/decimator/din:rsc -FIFO_DEPTH 0
directive set /top/fir/input:rsc -FIFO_DEPTH 0
directive set /top/fir/coeffs:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /top/fir/output:rsc -FIFO_DEPTH 0
directive set /top/din:rsc -FIFO_DEPTH 0
directive set /top/coeffs:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /top/connect1:cns -FIFO_DEPTH 0
directive set /top/connect0:cns -FIFO_DEPTH 0
directive set /top/fir/run/main -PIPELINE_INIT_INTERVAL 1
directive set /top/fir/run/SHIFT -UNROLL yes
directive set /top/fir/run/MAC -UNROLL yes
directive set /top/decimator/run/main -PIPELINE_INIT_INTERVAL 1
go architect
go extract
