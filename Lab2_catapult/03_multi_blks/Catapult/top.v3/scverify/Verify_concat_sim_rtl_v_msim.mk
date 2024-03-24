# ----------------------------------------------------------------------------
# Concat RTL Verilog output 'concat_sim_rtl.v' vs Untimed C++
#
#    HLS version: 2023.2/1059873 Production Release
#       HLS date: Mon Aug  7 10:54:31 PDT 2023
#  Flow Packages: HDL_Tcl 8.0a, SCVerify 10.4
#
#   Generated by: r12016@cad40
# Generated date: Sun Mar 24 17:33:34 CST 2024
#
# ----------------------------------------------------------------------------
# ===================================================
# DEFAULT GOAL is the help target
.PHONY: all
all: help

# ===================================================
# Directories (at the time this makefile was created)
#   MGC_HOME      /home/raid7_4/raid1_1/linux/mentor/Catapult/2023.2/Mgc_home
#   PROJECT_HOME  /home/raid7_2/user12/r12016/asoc/lab2/lab1_fir/03_multi_blks
#   SOLUTION_DIR  /home/raid7_2/user12/r12016/asoc/lab2/lab1_fir/03_multi_blks/Catapult/top.v3
#   WORKING_DIR   /home/raid7_2/user12/r12016/asoc/lab2/lab1_fir/03_multi_blks/Catapult/top.v3/.

# ===================================================
# VARIABLES
# 
MGC_HOME          = /home/raid7_4/raid1_1/linux/mentor/Catapult/2023.2/Mgc_home
export MGC_HOME

WORK_DIR  = $(CURDIR)
WORK2PROJ = ../..
WORK2SOLN = .
PROJ2WORK = ./Catapult/top.v3
PROJ2SOLN = ./Catapult/top.v3
export WORK_DIR
export WORK2PROJ
export WORK2SOLN
export PROJ2WORK
export PROJ2SOLN

# Variables that can be overridden from the make command line
ifeq "$(INCL_DIRS)" ""
INCL_DIRS                   = ./scverify . ../..
endif
export INCL_DIRS
ifeq "$(STAGE)" ""
STAGE                       = rtl
endif
export STAGE
ifeq "$(NETLIST_LEAF)" ""
NETLIST_LEAF                = concat_sim_rtl
endif
export NETLIST_LEAF
ifeq "$(SIMTOOL)" ""
SIMTOOL                     = msim
endif
export SIMTOOL
ifeq "$(NETLIST)" ""
NETLIST                     = v
endif
export NETLIST
ifeq "$(RTL_NETLIST_FNAME)" ""
RTL_NETLIST_FNAME           = /home/raid7_2/user12/r12016/asoc/lab2/lab1_fir/03_multi_blks/Catapult/top.v3/concat_sim_rtl.v
endif
export RTL_NETLIST_FNAME
ifeq "$(GATE_FNAME_BASE)" ""
GATE_FNAME_BASE             = gate.dc.v
endif
export GATE_FNAME_BASE
ifeq "$(INVOKE_ARGS)" ""
INVOKE_ARGS                 = 
endif
export INVOKE_ARGS
export SCVLIBS
export MODELSIM
TOP_HDL_ENTITY           := top
TOP_DU                   := scverify_top
CXX_TYPE                 := gcc
MSIM_SCRIPT              := ./Catapult/top.v3/scverify_msim.tcl
TARGET                   := scverify/$(NETLIST_LEAF)_$(NETLIST)_$(SIMTOOL)
export TOP_HDL_ENTITY
export TARGET

ifeq ($(RECUR),)
ifeq ($(STAGE),mapped)
ifeq ($(RTLTOOL),)
   $(error This makefile requires specifying the RTLTOOL variable on the make command line)
endif
endif
endif
# ===================================================
# Include environment variables set by flow options
include ./ccs_env.mk

# ===================================================
# Include makefile for default commands and variables
include $(MGC_HOME)/shared/include/mkfiles/ccs_default_cmds.mk

SYNTHESIS_FLOWPKG := DesignCompiler
SYN_FLOW          := DesignCompiler
# ===================================================
# SOURCES
# 
# Specify list of Questa SIM libraries to create
HDL_LIB_NAMES = work
# ===================================================
# Simulation libraries required by loaded Catapult libraries or gate simulation
SIMLIBS_V   += 
SIMLIBS_VHD += 
# 
# 
# Specify list of source files - MUST be ordered properly
ifeq ($(STAGE),gate)
ifeq ($(RTLTOOL),)
# Unless overridden on make command line, GATE_*_DEP is the last item in the netlist dependency list
ifeq ($(GATE_VHDL_DEP),)
GATE_VHDL_DEP = 
endif
ifeq ($(GATE_VLOG_DEP),)
GATE_VLOG_DEP = ./concat_sim_rtl.v/concat_sim_rtl.v.vts
endif
endif
VHDL_SRC +=  $(GATE_VHDL_DEP) 
VLOG_SRC +=  $(GATE_VLOG_DEP) ./scverify/ccs_wrapper_top.v/ccs_wrapper_top.v.vts
else
VHDL_SRC += 
VLOG_SRC += ./concat_sim_rtl.v/concat_sim_rtl.v.vts ./scverify/ccs_wrapper_top.v/ccs_wrapper_top.v.vts
endif
CXX_SRC  = ../../top_tb.cpp/top_tb.cpp.cxxts ./scverify/mc_testbench.cpp/mc_testbench.cpp.cxxts ./scverify/scverify_top.cpp/scverify_top.cpp.cxxts
# Specify RTL synthesis scripts (if any)
RTL_SCRIPT = 

# Specify hold time file name (for verifying synthesized netlists)
HLD_CONSTRAINT_FNAME = top_gate_constraints.cpp

# ===================================================
# GLOBAL OPTIONS
# 
# CXXFLAGS - global C++ options (apply to all C++ compilations) except for include file search paths
CXXFLAGS += $(COMPILERFLAGS) -DCCS_SCVERIFY -DSC_INCLUDE_DYNAMIC_PROCESSES -DSC_USE_STD_STRING -DTOP_HDL_ENTITY=$(TOP_HDL_ENTITY) -DCCS_DESIGN_FUNC_top_run -DCCS_DESIGN_TOP_$(TOP_HDL_ENTITY) -DCCS_MISMATCHED_OUTPUTS_ONLY $(F_WRAP_OPT)
# 
# If the make command line includes a definition of the special variable MC_DEFAULT_TRANSACTOR_LOG
# then define that value for all compilations as well
ifneq "$(MC_DEFAULT_TRANSACTOR_LOG)" ""
CXXFLAGS += -DMC_DEFAULT_TRANSACTOR_LOG=$(MC_DEFAULT_TRANSACTOR_LOG)
endif
# 
# CXX_INCLUDES - include file search paths
CXX_INCLUDES = ./scverify . ../..
# 
# TCL shell
TCLSH_CMD = /home/raid7_4/raid1_1/linux/mentor/Catapult/2023.2/Mgc_home/bin/tclsh8.5

# Pass along SCVerify_DEADLOCK_DETECTION option
ifneq "$(SCVerify_DEADLOCK_DETECTION)" "false"
CXXFLAGS += -DDEADLOCK_DETECTION
endif
# ===================================================
# PER SOURCE FILE SPECIALIZATIONS
# 
# Specify source file paths
ifeq ($(STAGE),gate)
ifneq ($(GATE_VHDL_DEP),)
$(TARGET)/$(notdir $(GATE_VHDL_DEP)): $(dir $(GATE_VHDL_DEP))
endif
ifneq ($(GATE_VLOG_DEP),)
$(TARGET)/$(notdir $(GATE_VLOG_DEP)): $(dir $(GATE_VLOG_DEP))
endif
endif
$(TARGET)/concat_sim_rtl.v.vts: ./concat_sim_rtl.v
$(TARGET)/ccs_wrapper_top.v.vts: ./scverify/ccs_wrapper_top.v
$(TARGET)/top_tb.cpp.cxxts: ../../top_tb.cpp
$(TARGET)/mc_testbench.cpp.cxxts: ./scverify/mc_testbench.cpp
$(TARGET)/scverify_top.cpp.cxxts: ./scverify/scverify_top.cpp
# 
# Specify additional C++ options per C++ source by setting CXX_OPTS
$(TARGET)/scverify_top.cpp.cxxts: CXX_OPTS=
$(TARGET)/mc_testbench.cpp.cxxts: CXX_OPTS=$(F_WRAP_OPT)
$(TARGET)/top_tb.cpp.cxxts: CXX_OPTS=
# 
# Specify dependencies
$(TARGET)/top_tb.cpp.cxxts: .ccs_env_opts/SCVerify_USE_CCS_BLOCK.ts
$(TARGET)/mc_testbench.cpp.cxxts: .ccs_env_opts/SCVerify_USE_CCS_BLOCK.ts
$(TARGET)/scverify_top.cpp.cxxts: .ccs_env_opts/SCVerify_USE_CCS_BLOCK.ts .ccs_env_opts/SCVerify_DEADLOCK_DETECTION.ts
# 
# Specify compilation library for HDL source
$(TARGET)/concat_sim_rtl.v.vts: HDL_LIB=work
$(TARGET)/ccs_wrapper_top.v.vts: HDL_LIB=work
ifeq ($(STAGE),gate)
ifneq ($(GATE_VHDL_DEP),)
$(TARGET)/$(notdir $(GATE_VHDL_DEP)): HDL_LIB=work
$(TARGET)/$(notdir $(GATE_VHDL_DEP)): DUT_E=top
endif
ifneq ($(GATE_VLOG_DEP),)
$(TARGET)/$(notdir $(GATE_VLOG_DEP)): HDL_LIB=work
$(TARGET)/$(notdir $(GATE_VLOG_DEP)): DUT_E=top
endif
endif
# 
# Specify additional HDL source compilation options if any
$(TARGET)/concat_sim_rtl.v.vts: VLOG_F_OPTS=
$(TARGET)/ccs_wrapper_top.v.vts: VLOG_F_OPTS=
$(TARGET)/concat_sim_rtl.v.vts: NCVLOG_F_OPTS=
$(TARGET)/ccs_wrapper_top.v.vts: NCVLOG_F_OPTS=
$(TARGET)/concat_sim_rtl.v.vts: VCS_F_OPTS=
$(TARGET)/ccs_wrapper_top.v.vts: VCS_F_OPTS=
# 
# Specify top design unit for HDL source
$(TARGET)/concat_sim_rtl.v.vts: DUT_E=top
$(TARGET)/ccs_wrapper_top.v.vts: DUT_E=ccs_wrapper

# Specify top design unit
$(TARGET)/ccs_wrapper_top.v.vts: VLOG_TOP=1

ifneq "$(RTLTOOL)" ""
# ===================================================
# Include makefile for RTL synthesis
include $(MGC_HOME)/shared/include/mkfiles/ccs_$(RTLTOOL).mk
else
# ===================================================
# Include makefile for simulator
include $(MGC_HOME)/shared/include/mkfiles/ccs_questasim.mk
endif

