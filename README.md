# HiPAC - PIConGPU
This manual aims to provide instruction on PIConGPU for HiPAC contest 2024 @ NCHC.

## Installation

**Installation may take 1h to 1h20m**

Install gcc and cmake. Be noted that gcc@13 may lead to cimpilation error.
```
sudo apt-get install gcc-12 g++-12 gfortran-12 git build-essential
#sudo apt-get install cmake file cmake-curses-gui
```

Install spack and load spack environment.
```
#git clone --depth=100 --branch=releases/v0.22.0 https://github.com/spack/spack.git ~/spack
git clone -c feature.manyFiles=true https://github.com/spack/spack.git
source $HOME/spack/share/spack/setup-env.sh
```

Configure your spack compiler setting. Make sure that the spack setting file is modified so that only gcc@12 is used.
```
spack compiler find
vi ~/.spack/linux/compilers.yaml
```

For reliable builds and to avoid compatibility issues, it's advised to use spack for installing both cuda and openmpi (`spack install openmpi+cuda`) instead of relying on potentially outdated system packages. Additionally, standardize on the system-provided gcc@12, while managing other dependencies through spack for consistency and compatibility.
```
#spack external find --all --exclude cuda --exclude openmpi --exclude gcc
```

Follow the spack install instruction in https://github.com/ComputationalRadiationPhysics/picongpu/blob/dev/INSTALL.rst
it is recommended to use `spack install cmake@3.29.2` instead of system-provided cmake@3.22.x. 
If checksumerror occurs, try `spack install --no-checksum`
```
spack install openmpi+cuda ^cuda@12.2.1 ^cmake@3.29.2
spack load openmpi cmake@3.29.2
spack install --reuse openpmd-api~adios2 ^hdf5+hl+fortran ^cmake@3.29.2
spack install --reuse pngwriter ^libpng ^cmake@3.29.2
spack install --reuse libjpeg-turbo
spack install --reuse fftw
spack install --reuse boost+program_options+atomic+serialization
```



The following is for isaac and is not required by HiPAC contest; can skip this
```
spack install --reuse adios2 ^c-blosc ^cmake@3.29.2
#spack install --reuse --no-checksum adios2 ^c-blosc
spack install --reuse glm@develop ^cmake@3.29.2
spack install --reuse isaac@develop ^cuda@12.2.1 ^boost+program_options+atomic+serialization ^jansson ^icet ^libjpeg-turbo ^cmake@3.29.2
spack install --reuse isaac-server@develop ^boost+program_options+atomic+serialization ^libjpeg-turbo ^cmake@3.29.2
```

Install the main program - PIConGPU.
git clone https://github.com/ComputationalRadiationPhysics/picongpu.git $HOME/src/picongpu
cd $HOME/src/picongpu && git fetch && git pull


## Setup input files and execute PIConGPU

Setup environment
```
source picongpu.profile
mkdir $SCRATCH/picInputs
mkdir $SCRATCH/runs
```
One may try testing examples:
1. build an example case
```
pic-create $PIC_EXAMPLES/LaserWakefield $SCRATCH/picInputs/myLWFA
cd $SCRATCH/picInputs/myLWFA
pic-build -c"-DPIC_USE_ISAAC=OFF -DPIC_USE_openPMD=ON -DPIC_USE_PNGwriter=ON"
```

2. run this example with different cfg files
```
tbg -s bash -c etc/picongpu/4.cfg -t etc/picongpu/bash/mpiexec.tpl $SCRATCH/runs/lwfa_4GPU
```

3. another example
pic-create $PIC_EXAMPLES/FoilLCT $SCRATCH/picInputs/myFoilLCT
cd $SCRATCH/picInputs/myFoilLCT
pic-build -c"-DPIC_USE_ISAAC=ON -DPIC_USE_openPMD=ON -DPIC_USE_PNGwriter=ON"
tbg -s bash -c etc/picongpu/4_isaac.cfg -t etc/picongpu/bash/mpiexec.tpl $SCRATCH/runs/FoilLCT_4GPU_isaac





# HiPAC runs
pic-build -c"-DPIC_USE_ISAAC=OFF -DPIC_USE_openPMD=ON -DPIC_USE_PNGwriter=ON"
tbg -s bash -c etc/picongpu/test_run.cfg -t etc/picongpu/bash/mpiexec.tpl $SCRATCH/runs/test_01





