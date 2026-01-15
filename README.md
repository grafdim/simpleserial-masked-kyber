# Masked Kyber768 for the Chipwhisperer platform
The chipwhisperer integration of 
[First-order masked Kyber768 implementation](https://github.com/masked-kyber-m4/mkm4) 
no longer works due to breaking changes in the structure of the 
[chipwhisperer repo](https://github.com/newaetech/chipwhisperer).
This repo fixes the integration by reorganizing it 
in a friendly structure and slightly modifying the relevant 
makefile. I claim no rights to the codebase. All credits go 
to the authors of the original codebase (which you can find 
following the first hyperlink in this document). 

# Installation

```
git clone https://github.com/newaetech/chipwhisperer
cd chipwhisperer/firmware/mcu
git submodule add https://github.com/grafdim/simpleserial-masked-kyber
cd simpleserial-masked-kyber
make PLATFORM=YOUR_CHIPWHISPERER_PLATFORM
```
