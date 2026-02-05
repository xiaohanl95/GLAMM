# GLAMM: GFDL's Aerosol Microphysics Model

**GLAMM** is a newly developed modal aerosol microphysics scheme integrated into the GFDL AM4.0 model. Unlike the bulk aerosol schemes previously used in AM4.0, GLAMM employs a modal representation that explicitly tracks the evolution of aerosol mass, number concentration, and mixing state (internal and external) across multiple modes. This repository contains the source code for the GLAMM component and the necessary modifications to the AM4.0 host model. Questions regarding GLAMM can be reached to the developer Xiaohan Li (xiaohanl@princeton.edu).

## 📄 Reference & Citation
The full description of the model and its evaluation with observational constraints can be found in:
>**The GFDL's Aerosol Microphysics Model (GLAMM) – Part 1: Model Description and Aerosol Evaluation with Observational Constraints** 
>
>**Authors:** Xiaohan Li, Fabien Paulot, Uriel Ramirez, Susanne E. Bauer, Xiaohong Liu, Paul Ginoux 
>
> **Journal:** *Journal of Advances in Modeling Earth Systems (JAMES)*

Please cite this paper if you use GLAMM in your research.

## 🔬 Scientific Overview
GLAMM provides a prognostic treatment of aerosol microphysical processes. It moves beyond the bulk method by independently tracking **Number ($N$)** and **Mass ($M$)** for each mode.

### Key Capabilities
* **Modal Representation:** Represents aerosols as overlapping subpopulations (modes) with log-normal distributions.
* **Prognostic Mixing State:** Explicitly handles internal vs. external mixing and aging processes (e.g., hydrophobic to hydrophilic transition).
* **Flexible Configuration:** Supports variable mode definitions, ranging from simplified setups (e.g., 3-mode) to the comprehensive 12-mode configuration used in the reference paper.

### Microphysical Processes
The model integrates parameterizations including:
* **New Particle Formation (NPF):** Binary nucleation of $H_2SO_4-H_2O$ (Vehkamäki et al., 2002).
* **Condensation:** Kinetic uptake of $H_2SO_4$ vapor.
* **Coagulation:** Intra-mode (self) and inter-mode coagulation (Brownian, turbulent shear, gravitational collection, etc.).
* **Aging (Intermodal Transfer):** Explicit transfer of hydrophobic cores (BC/OA) to hydrophilic modes upon acquiring sufficient sulfate coating ($>5\%$ mass fraction).
* **Activation:** Physically based droplet activation (Abdul-Razzak and Ghan, 2000).
* **Deposition:** Resistance-based dry deposition and size-resolved gravitational settling (sedimentation), and hygroscopicity-dependent wet-removal.

## ⚙️ Default Configuration (12-Mode)
The reference configuration utilizes **12 aerosol modes** to capture the full complexity of atmospheric aerosols.

| Mode | Description | Tracers | $D_{g,emis}$ ($\mu m$) | $\sigma_g$ |
| :--- | :--- | :--- | :--- | :--- |
| **AKK** | Aitken mode sulfate | $N, M_{sulf}$ | 0.013 | 1.6 |
| **ACC** | Accumulation mode sulfate | $N, M_{sulf}$ | 0.068 | 1.8 |
| **DD1** | Accumulation mode dust | $N, M_{dust}, M_{sulf}$ | 0.58 | 1.8 |
| **DD2** | Coarse mode dust | $N, M_{dust}, M_{sulf}$ | 3.20 | 1.7 |
| **SSA** | Accumulation mode sea salt | $N, M_{seas}, M_{sulf}$ | 0.37 | 1.8 |
| **SSC** | Coarse mode sea salt | $N, M_{seas}, M_{sulf}$ | 3.06 | 1.83 |
| **OA1** | Hydrophobic organic aerosol | $N, M_{ocar}, M_{sulf}$ | 0.030 | 1.8 |
| **OA2** | Hydrophilic organic aerosol | $N, M_{ocar}, M_{sulf}$ | 0.030 | 1.8 |
| **BC1** | Hydrophobic black carbon | $N, M_{bcar}, M_{sulf}$ | 0.030 | 1.8 |
| **BC2** | Hydrophilic black carbon | $N, M_{bcar}, M_{sulf}$ | 0.030 | 1.8 |
| **MXA** | Accumulation mixed aerosol | $N, M_{all}$ | N/A | 1.8 |
| **MXC** | Coarse mixed aerosol | $N, M_{all}$ | N/A | 1.8 |

*Note: M_all includes sulfate, black carbon, organic, dust, and sea salt.*

## 🚀 Getting Started

### Prerequisites
* **GFDL FMS:** The Flexible Modeling System framework.
* **Compiler:** Intel Fortran Compiler (ifort) or GNU Fortran (gfortran) with MPI support.
* **NetCDF:** Libraries for input/output.

### Installation & Compilation

**1. Get the Source Code**
Clone the repository using the `--recursive` flag to ensure all submodules (including FMS) are downloaded correctly.
```bash
git clone --recursive https://github.com/xiaohanl95/GLAMM.git
```
**2. Configure the Environment**
Navigate to the execution directory and customize the environment settings to match your cluster's modules and paths.
```bash
cd GLAMM
# Edit the environment setup script
vim exec/env.sh
```
**3. Configure the Make Template**
Edit the compiler template to set the correct flags and library paths for your system.
```bash
# Edit the makefile template
vim exec/intel-classic.mk
```
> Compiler Flags: Update ```FC``` (Fortran), ```CC``` (C), and ```LD``` (Linker) macros as needed for your specific compiler version.
>
> Libraries: Update the ```LIBS :=``` path to point to your local NetCDF and MPI installations

**4. Build the Model**
Once the environment and makefile templates are configured, run the build script. We recommend piping the output to a log file to check for errors.
```bash
./build_am4_glamm.sh 2>&1 | tee log.compile
```

**5. Verify Compilation**
If the previous steps complete successfully, you will find the executable ```fms_am4_glamm.x``` located in the ```exec``` directory.

6. 
**5. Compilation Check**
If all the previous steps are successful, you should be able to find the excuteble fms_am4_glamm.x under the folder ```exec```
### Compilations
Download the src code
git clone --recursive https://github.com/xiaohanl95/GLAMM.git
Set-up the environment
vim exec/env.sh
revise the enviroment for the compilation

Set -up the template
vim exec/intel-classic.mk
revise the flag for FC, CC, LD for commends macros
change LIBS := if needed 

After all env.sh and intel-classic.mk get changed, 
do
./build_am4_glamm.sh 2>&1 | tee log.compile



### Directory Structure
* `src/`: Source code for GLAMM and AM4 modifications.
    * `atmos_param/aerosol_microphysics/`: Core GLAMM modules.
* `run/`: Sample run scripts and namelists.
* `input/`: [TODO: Link to input data or description of required files].

### Compilation
[TODO: Insert specific compilation steps here, e.g., using mkmf]
```bash
# Example
cd exp/
./compile_glamm.sh
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



## 🚀 Usage

### Requirements
* **Host Model:** GFDL AM4.0.
* **Input Data:**
    * **Anthropogenic Emissions:** CEDS (Community Emissions Data System) for CMIP6.
    * **Natural Emissions:** Online parameterizations for Sea Salt (Gong, 2003; Jaeglé et al., 2011) and Dust (Kok, 2011).

### Running the Model
The model can be run in a "double-call" diagnostic configuration (as described in the Part 1 paper). In this setup:
1.  The standard AM4.0 bulk aerosol scheme remains active for radiative transfer and cloud microphysics.
2.  GLAMM runs simultaneously as a passive tracer package, undergoing full microphysical processing without feeding back to the climate.
This allows for direct evaluation of microphysical budgets without perturbing the host model's circulation.

*See `[TODO: Insert Path to Run Scripts]` for example namelists and run scripts.*



