# ----------------------------------------------------------------------------
# Original Design + Testbench
#
#    HLS version: 2023.2/1059873 Production Release
#       HLS date: Mon Aug  7 10:54:31 PDT 2023
#  Flow Packages: HDL_Tcl 8.0a, SCVerify 10.4
#
#   Generated by: r12016@cad40
# Generated date: Sun Mar 24 15:34:06 CST 2024
#
# ----------------------------------------------------------------------------
# ===================================================
# DEFAULT GOAL is the help target
.PHONY: all
all: help

# ===================================================
# Directories (at the time this makefile was created)
#   MGC_HOME      /home/raid7_4/raid1_1/linux/mentor/Catapult/2023.2/Mgc_home
#   PROJECT_HOME  /home/raid7_2/user12/r12016/asoc
#   SOLUTION_DIR  /home/raid7_2/user12/r12016/asoc/Catapult_1/fir.v1
#   WORKING_DIR   /home/raid7_2/user12/r12016/asoc/Catapult_1/fir.v1/.

# ===================================================
# VARIABLES
# 
MGC_HOME          = /home/raid7_4/raid1_1/linux/mentor/Catapult/2023.2/Mgc_home
export MGC_HOME

WORK_DIR  = $(CURDIR)
WORK2PROJ = ../..
WORK2SOLN = .
PROJ2WORK = ./Catapult_1/fir.v1
PROJ2SOLN = ./Catapult_1/fir.v1
export WORK_DIR
export WORK2PROJ
export WORK2SOLN
export PROJ2WORK
export PROJ2SOLN

# Variables that can be overridden from the make command line
ifeq "$(INCL_DIRS)" ""
INCL_DIRS                   =  .
endif
export INCL_DIRS
ifeq "$(STAGE)" ""
STAGE                       = orig
endif
export STAGE
ifeq "$(NETLIST_LEAF)" ""
NETLIST_LEAF                = orig
endif
export NETLIST_LEAF
ifeq "$(SIMTOOL)" ""
SIMTOOL                     = osci
endif
export SIMTOOL
ifeq "$(NETLIST)" ""
NETLIST                     = cxx
endif
export NETLIST
ifeq "$(RTL_NETLIST_FNAME)" ""
RTL_NETLIST_FNAME           = /home/raid7_2/user12/r12016/asoc/Catapult_1/fir.v1/orig
endif
export RTL_NETLIST_FNAME
ifeq "$(INVOKE_ARGS)" ""
INVOKE_ARGS                 = 
endif
export INVOKE_ARGS
export SCVLIBS
LINK_SYSTEMC             := true
TOP_HDL_ENTITY           := dummy
TOP_DU                   := scverify_top
TARGET                   := scverify/$(NETLIST_LEAF)_$(NETLIST)_$(SIMTOOL)
LINK_SYSTEMC             := true
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

SYNTHESIS_FLOWPKG := 
SYN_FLOW          := 
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
GATE_VLOG_DEP = 
endif
endif
VHDL_SRC +=  $(GATE_VHDL_DEP) 
VLOG_SRC +=  $(GATE_VLOG_DEP) 
else
VHDL_SRC += 
VLOG_SRC += 
endif
CXX_SRC  = ../../lab2/lab1_fir/01_walkthrough_loops/fir_tb.cpp/fir_tb.cpp.cxxts
# Specify RTL synthesis scripts (if any)
RTL_SCRIPT = 

# Specify hold time file name (for verifying synthesized netlists)
HLD_CONSTRAINT_FNAME = top_gate_constraints.cpp

# ===================================================
# GLOBAL OPTIONS
# 
# CXXFLAGS - global C++ options (apply to all C++ compilations) except for include file search paths
CXXFLAGS += $(COMPILERFLAGS) -DSC_INCLUDE_DYNAMIC_PROCESSES -DSC_USE_STD_STRING -DCCS_MISMATCHED_OUTPUTS_ONLY
# 
# If the make command line includes a definition of the special variable MC_DEFAULT_TRANSACTOR_LOG
# then define that value for all compilations as well
ifneq "$(MC_DEFAULT_TRANSACTOR_LOG)" ""
CXXFLAGS += -DMC_DEFAULT_TRANSACTOR_LOG=$(MC_DEFAULT_TRANSACTOR_LOG)
endif
# 
# CXX_INCLUDES - include file search paths
CXX_INCLUDES = . ../..
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
$(TARGET)/fir_tb.cpp.cxxts: ../../lab2/lab1_fir/01_walkthrough_loops/fir_tb.cpp
# 
# Specify additional C++ options per C++ source by setting CXX_OPTS
$(TARGET)/fir_tb.cpp.cxxts: CXX_OPTS=
# 
# Specify dependencies
$(TARGET)/fir_tb.cpp.cxxts: .ccs_env_opts/SCVerify_USE_CCS_BLOCK.ts
# 
# Specify compilation library for HDL source
ifeq ($(STAGE),gate)
ifneq ($(GATE_VHDL_DEP),)
$(TARGET)/$(notdir $(GATE_VHDL_DEP)): HDL_LIB=work
endif
ifneq ($(GATE_VLOG_DEP),)
$(TARGET)/$(notdir $(GATE_VLOG_DEP)): HDL_LIB=work
endif
endif
# 
# Specify additional HDL source compilation options if any
# 
# Specify top design unit for HDL source

# Specify top design unit

ifneq "$(RTLTOOL)" ""
# ===================================================
# Include makefile for RTL synthesis
include $(MGC_HOME)/shared/include/mkfiles/ccs_$(RTLTOOL).mk
else
# ===================================================
# Include makefile for simulator
include $(MGC_HOME)/shared/include/mkfiles/ccs_$(SIMTOOL).mk
endif

