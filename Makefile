#*******************************************************************************
# Copyright (C) 2016 Marvell International Ltd.
#
# This software file (the "File") is owned and distributed by Marvell
# International Ltd. and/or its affiliates ("Marvell") under the following
# alternative licensing terms.  Once you have made an election to distribute the
# File under one of the following license alternatives, please (i) delete this
# introductory statement regarding license alternatives, (ii) delete the three
# license alternatives that you have not elected to use and (iii) preserve the
# Marvell copyright notice above.
#
#********************************************************************************
# Marvell Commercial License Option
#
# If you received this File from Marvell and you have entered into a commercial
# license agreement (a "Commercial License") with Marvell, the File is licensed
# to you under the terms of the applicable Commercial License.
#
#********************************************************************************
# Marvell GPL License Option
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 2 of the License, or any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#********************************************************************************
# Marvell GNU General Public License FreeRTOS Exception
#
# If you received this File from Marvell, you may opt to use, redistribute and/or
# modify this File in accordance with the terms and conditions of the Lesser
# General Public License Version 2.1 plus the following FreeRTOS exception.
# An independent module is a module which is not derived from or based on
# FreeRTOS.
# Clause 1:
# Linking FreeRTOS statically or dynamically with other modules is making a
# combined work based on FreeRTOS. Thus, the terms and conditions of the GNU
# General Public License cover the whole combination.
# As a special exception, the copyright holder of FreeRTOS gives you permission
# to link FreeRTOS with independent modules that communicate with FreeRTOS solely
# through the FreeRTOS API interface, regardless of the license terms of these
# independent modules, and to copy and distribute the resulting combined work
# under terms of your choice, provided that:
# 1. Every copy of the combined work is accompanied by a written statement that
# details to the recipient the version of FreeRTOS used and an offer by yourself
# to provide the FreeRTOS source code (including any modifications you may have
# made) should the recipient request it.
# 2. The combined work is not itself an RTOS, scheduler, kernel or related
# product.
# 3. The independent modules add significant and primary functionality to
# FreeRTOS and do not merely extend the existing functionality already present in
# FreeRTOS.
# Clause 2:
# FreeRTOS may not be used for any competitive or comparative purpose, including
# the publication of any form of run time or compile time metric, without the
# express permission of Real Time Engineers Ltd. (this is the norm within the
# industry and is intended to ensure information accuracy).
#
#********************************************************************************
# Marvell BSD License Option
#
# If you received this File from Marvell, you may opt to use, redistribute and/or
# modify this File under the following licensing terms.
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
#
#      * Redistributions of source code must retain the above copyright notice,
#        this list of conditions and the following disclaimer.
#
#      * Redistributions in binary form must reproduce the above copyright
#        notice, this list of conditions and the following disclaimer in the
#        documentation and/or other materials provided with the distribution.
#
#      * Neither the name of Marvell nor the names of its contributors may be
#        used to endorse or promote products derived from this software without
#        specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#*******************************************************************************

# set mv_ddr directory
ifdef CONFIG_SPL_BUILD
MV_DDR_ROOT = $(src)
else
MV_DDR_ROOT = .
endif

# set mv_ddr build message and version string source file
MV_DDR_VER_CSRC = mv_ddr_build_message.c

# create mv_ddr build message and version string source file
$(shell $(MV_DDR_ROOT)/scripts/localversion.sh $(MV_DDR_ROOT) $(MV_DDR_VER_CSRC) 2> /dev/null)

# ******************
# U-BOOT SPL SUPPORT
# ******************
ifdef CONFIG_SPL_BUILD
obj-$(CONFIG_SPL_BUILD) += a38x/mv_ddr_plat.o
obj-$(CONFIG_SPL_BUILD) += a38x/mv_ddr_brd.o
obj-$(CONFIG_SPL_BUILD) += a38x/mv_ddr_static.o
obj-$(CONFIG_SPL_BUILD) += a38x/mv_ddr_sys_env_lib.o
obj-$(CONFIG_SPL_BUILD) += ddr_init.o
obj-$(CONFIG_SPL_BUILD) += ddr3_debug.o
obj-$(CONFIG_SPL_BUILD) += ddr3_init.o
obj-$(CONFIG_SPL_BUILD) += ddr3_training.o
obj-$(CONFIG_SPL_BUILD) += ddr3_training_bist.o
obj-$(CONFIG_SPL_BUILD) += ddr3_training_centralization.o
obj-$(CONFIG_SPL_BUILD) += ddr3_training_db.o
obj-$(CONFIG_SPL_BUILD) += ddr3_training_hw_algo.o
obj-$(CONFIG_SPL_BUILD) += ddr3_training_ip_engine.o
obj-$(CONFIG_SPL_BUILD) += ddr3_training_leveling.o
obj-$(CONFIG_SPL_BUILD) += ddr3_training_pbs.o
obj-$(CONFIG_SPL_BUILD) += mv_ddr_build_message.o
obj-$(CONFIG_SPL_BUILD) += mv_ddr_common.o
obj-$(CONFIG_SPL_BUILD) += mv_ddr_spd.o
obj-$(CONFIG_SPL_BUILD) += mv_ddr_topology.o
obj-$(CONFIG_SPL_BUILD) += mv_ddr4_mpr_pda_if.o
obj-$(CONFIG_SPL_BUILD) += mv_ddr4_training.o
obj-$(CONFIG_SPL_BUILD) += mv_ddr4_training_calibration.o
obj-$(CONFIG_SPL_BUILD) += mv_ddr4_training_db.o
obj-$(CONFIG_SPL_BUILD) += mv_ddr4_training_leveling.o
obj-$(CONFIG_SPL_BUILD) += xor.o

# ******************************
# U-BOOT MARVELL 2013.01 SUPPORT
# ******************************
else ifeq ($(DDR3LIB), 3)
BH_PATH ?= $(MV_DDR_ROOT)/../..
include $(BH_PATH)/base.mk

OBJ_DIR = $(BH_PATH)/src_ddr/lib
MV_DDR_SRCPATH = $(MV_DDR_ROOT) $(MV_DDR_ROOT)/a38x
INCPATH = $(MV_DDR_SRCPATH)
INCLUDE = $(addprefix -I,$(INCPATH))
INCLUDE += -I$(BH_PATH)/inc/common

MV_DDR_LIBNAME = $(MV_DDR_ROOT)/$(DDRTYPE)_training_$(LIBNAME).lib
MV_DDR_LIB = $(OBJ_DIR)/$(MV_DDR_LIBNAME)

MV_DDR_CSRC = $(foreach DIR,$(MV_DDR_SRCPATH),$(wildcard $(DIR)/*.c))
MV_DDR_COBJ = $(patsubst %.c,$(OBJ_DIR)/%.o,$(MV_DDR_CSRC))
# add mv_ddr build message and version string object
MV_DDR_VER_COBJ = $(patsubst %.c,$(OBJ_DIR)/%.o,$(MV_DDR_VER_CSRC))
MV_DDR_COBJ += $(MV_DDR_VER_COBJ)

.SILENT:
all: header create_dir $(MV_DDR_LIB)

# mv_ddr code compilation
$(OBJ_DIR)/%.o: %.c
	$(ECHO) "  CC      $<"
	$(CC) $(INCLUDE) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<

$(MV_DDR_LIB): $(MV_DDR_COBJ)
	$(ECHO) "  AR      $(MV_DDR_LIBNAME)"
	$(AR) rcs $(MV_DDR_LIB) $(MV_DDR_COBJ)

$(MV_DDR_VER_COBJ):
	$(ECHO) "  CC      $(MV_DDR_VER_CSRC)"
	$(CC) -c $(CFLAGS) -o $@ $(MV_DDR_VER_CSRC)

create_dir:
	$(MKDIR) $(OBJ_DIR)/a38x

header:
	$(ECHO) "\nBuilding DRAM driver"

clean:
	$(ECHO) "  CLEAN"
	@$(RM) $(MV_DDR_COBJ) $(MV_DDR_LIB)

# *******************
# MARVELL ATF SUPPORT
# *******************
else
CROSS    = $(CROSS_COMPILE)

LD       = $(CROSS)ld
CC       = $(CROSS)gcc
AS       = $(CROSS)gcc
AR       = $(CROSS)ar
OBJCOPY  = $(CROSS)objcopy
OBJDUMP  = $(CROSS)objdump
STRIP    = $(CROSS)strip

RM       = @rm -rf
MKDIR    = @mkdir -p
CD       = @cd
MV       = @mv
CP       = @cp
CAT      = @cat
PWD      = @pwd
ECHO     = @echo

# OBJ_DIR set in ble/ble.mk
OBJ_DIR ?= $(MV_DDR_ROOT)
MV_DDR4 = y

MV_DDR_SRCPATH = $(MV_DDR_ROOT) $(MV_DDR_ROOT)/apn806

INCPATH = $(MV_DDR_SRCPATH)
INCLUDE = $(addprefix -I,$(INCPATH))
# PLAT_INCLUDES set in ble/ble.mk
INCLUDE += $(PLAT_INCLUDES)

MV_DDR_LIBNAME = mv_ddr_lib.a
MV_DDR_LIB = $(OBJ_DIR)/$(MV_DDR_LIBNAME)

CFLAGS = -Wall -Werror -Os -ffreestanding -mlittle-endian -g -gdwarf-2 -nostdinc
# PLATFORM is set in ble/ble.mk
CFLAGS += -march=armv8-a -fpie $(INCLUDE)
CFLAGS += -DMV_DDR_ATF -DCONFIG_APN806
#CFLAGS += -DCONFIG_MC_STATIC
#CFLAGS += -DCONFIG_MC_STATIC_PRINT
#CFLAGS += -DCONFIG_PHY_STATIC
#CFLAGS += -DCONFIG_PHY_STATIC_PRINT
ifeq ($(MV_DDR4),y)
CFLAGS += -DCONFIG_DDR4
endif
ifneq ($(findstring a80x0,$(PLATFORM)),)
CFLAGS += -DCONFIG_64BIT
CFLAGS += -DA80X0
endif
ifneq ($(findstring a70x0,$(PLATFORM)),)
CFLAGS += -DA70X0
endif
ifneq ($(findstring a7040,$(PLATFORM)),)
CFLAGS += -DA70X0
endif
ifneq ($(findstring a3900,$(PLATFORM)),)
CFLAGS += -DA70X0
endif
ifneq ($(ARCH),)
CFLAGS += -D$(ARCH)
endif

LDFLAGS = -Xlinker --discard-all -Wl,--build-id=none -static -nostartfiles

MV_DDR_CSRC = $(foreach DIR,$(MV_DDR_SRCPATH),$(wildcard $(DIR)/*.c))

MV_DDR_COBJ = $(patsubst %.c,$(OBJ_DIR)/%.o,$(MV_DDR_CSRC))
# add mv_ddr build message and version string object
MV_DDR_VER_COBJ = $(patsubst %.c,$(OBJ_DIR)/%.o,$(MV_DDR_VER_CSRC))
MV_DDR_COBJ += $(MV_DDR_VER_COBJ)

.SILENT:

all: check_env header create_dir $(MV_DDR_LIB)

# mv_ddr code compilation
$(OBJ_DIR)/%.o: %.c
	$(ECHO) "  CC      $<"
	$(CC) -c $(CFLAGS) -o $@ $<

$(MV_DDR_LIB): $(MV_DDR_COBJ)
	$(ECHO) "  AR      $(MV_DDR_LIBNAME)"
	$(AR) rcs $(MV_DDR_LIB) $(MV_DDR_COBJ)

$(MV_DDR_VER_COBJ):
	$(ECHO) "  CC      $(MV_DDR_VER_CSRC)"
	$(CC) -c $(CFLAGS) -o $@ $(MV_DDR_VER_CSRC)

create_dir:
	$(MKDIR) $(OBJ_DIR)/apn806

header:
	$(ECHO) "\nBuilding DRAM driver"

check_env:
ifndef PLATFORM
	$(error PLATFORM is undefined. please set PLATFORM variable)
endif

clean:
	$(ECHO) "  CLEAN"
	@$(RM) $(MV_DDR_COBJ) $(MV_DDR_LIB)

endif
