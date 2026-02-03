#!/bin/tcsh

cd run
mkdir -p RESTART

# Copy over the executable
cp ../exec/fms_am4_glamm.x .

# Copy or symlink the data

# Run the model
# In this case, the model is using 384 cores and 1 threads
# This can be updated by changing the input.nml
# coupler_nml::atmos_npes = 384
# coupler_nml::atmos_nthreads = 1

# layout(1) * layout(2) * 6 in fv_core_nml and land_model_nml must equal the number of atmos_npes
# fv_core_nml::layout   = 4,16
# land_model_nml::layout   = 4,16

# layout(1) * layout(2) in ice_model_nml must equal atmos_npes
# ice_model_nml::layout = 128,3

# NOTE: layout must be divisible by io_layout

# This is needed for GAEA on c5
# setenv FI_VERBS_PREFER_XRC 0

srun --ntasks=384 --cpus-per-task=1 --export=ALL,OMP_NUM_THREADS=1 ./fms_am4_glamm.x | & tee fms.out

echo "----------------- END OF MODEL RUN -----------------"
