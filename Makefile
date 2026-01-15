# Hey Emacs, this is a -*- makefile -*-
#----------------------------------------------------------------------------
#
# Makefile for ChipWhisperer SimpleSerial-Kyber Program
#
#----------------------------------------------------------------------------
# On command line:
#
# make all = Make software.
#
# make clean = Clean out built project files.
#
# make coff = Convert ELF to AVR COFF.
#
# make extcoff = Convert ELF to AVR Extended COFF.
#
# make program = Download the hex file to the device, using avrdude.
#                Please customize the avrdude settings below first!
#
# make debug = Start either simulavr or avarice as specified for debugging, 
#              with avr-gdb or avr-insight as the front end for debugging.
#
# make filename.s = Just compile filename.c into the assembler code only.
#
# make filename.i = Create a preprocessed source file for use in submitting
#                   bug reports to the GCC project.
#
# To rebuild project do "make clean" then "make all".
#----------------------------------------------------------------------------

# Target file name (without extension). 
# This is the name of the compiled .hex file.
TARGET = simpleserial-masked-kyber
VPATH = mkm4/common:mkm4/crypto_kem/kyber768/m4
#Include directory from PQ-lib
#IDIR := ./pqlib/pqlib/include
#CPPFLAGS += -I$(IDIR)
# List C source files here.
# Header files (.h) are automatically pulled in.
#KYBERDIR = ./pqlib/pqlib/src/kyber
EXTRAINCDIRS += mkm4/common mkm4/crypto_kem/kyber768/m4

CDEFS += -DCW -DCOMPARE_USE_A2A

ASFLAGS += -mfpu=fpv4-sp-d16

SRC += $(wildcard  ./*.c)
ASRC += $(wildcard ./*.S)
# -----------------------------------------------------------------------------

ifeq ($(PLATFORM),CW303)
CRYPTO_TARGET = AVRCRYPTOLIB
else ifeq ($(PLATFORM),CW308_STM32F3)
CRYPTO_TARGET = MBEDTLS
else ifeq ($(PLATFORM),CWLITEARM)
CRYPTO_TARGET = MBEDTLS
else
$(error: Must specify CRYPTO_TARGET=MBEDTLS or CRYPTO_TARGET=AVRCRYPTOLIB)
endif


FIRMWAREPATH = ..
include $(FIRMWAREPATH)/Makefile.inc
