# AM4 GLAMM
TODO

## Compiling the model:
The script build_am4_glamm.sh can be run to compile the model.

The script exec/env.sh should be updated to load the environment in your system.
Libraries required:

    NetCDF C and Fortran (77/90) headers and libraries
    Fortran 2003 standard compiler
    Fortran compiler that supports Cray Pointers
    MPI C and Fortran headers and librarie

The file exec/intel-classic.mk should be updated with the flags, based on your compiler

## Getting input files:
TODO

## Running the model:
The script c96L33_amip_glamm.sh can be used to run the model. It is currently set up to run with 384 nodes and 1 openmp threads, but the script has guidelines on how to update this.
