#
# module.mk
#
# Copyright (C) 2010 - 2017 Creytiv.com
#

#
# To build libzrtpcppcore run the following commands:
#
#     git clone https://github.com/wernerd/ZRTPCPP.git
#     cd ZRTPCPP
#     mkdir build
#     cd build
#     cmake -DCMAKE_POSITION_INDEPENDENT_CODE=1 -DCORE_LIB=1 -DSDES=1 -DBUILD_STATIC=1 ..
#     make
#

# GNU ZRTP C++ library (ZRTPCPP) source directory
ZRTP ?= ../ZRTPCPP

ZRTP_LIB := $(shell find $(ZRTP) -name libzrtpcppcore.a)

MOD		:= gzrtp
$(MOD)_SRCS	+= gzrtp.cpp session.cpp stream.cpp messages.cpp
$(MOD)_LFLAGS	+= $(ZRTP_LIB) -lstdc++
$(MOD)_CXXFLAGS   += \
	-I$(ZRTP) \
	-I$(ZRTP)/zrtp \
	-I$(ZRTP)/srtp

$(MOD)_CXXFLAGS   += -O2 -Wall -fPIC

include mk/mod.mk
