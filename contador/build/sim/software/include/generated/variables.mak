PACKAGES=libc libcompiler_rt libbase libfatfs liblitespi liblitedram libliteeth liblitesdcard liblitesata bios
PACKAGE_DIRS=/home/julio/eda/litex/litex/litex/soc/software/libc /home/julio/eda/litex/litex/litex/soc/software/libcompiler_rt /home/julio/eda/litex/litex/litex/soc/software/libbase /home/julio/eda/litex/litex/litex/soc/software/libfatfs /home/julio/eda/litex/litex/litex/soc/software/liblitespi /home/julio/eda/litex/litex/litex/soc/software/liblitedram /home/julio/eda/litex/litex/litex/soc/software/libliteeth /home/julio/eda/litex/litex/litex/soc/software/liblitesdcard /home/julio/eda/litex/litex/litex/soc/software/liblitesata /home/julio/eda/litex/litex/litex/soc/software/bios
LIBS=libc libcompiler_rt libbase libfatfs liblitespi liblitedram libliteeth liblitesdcard liblitesata
TRIPLE=riscv64-unknown-elf
CPU=vexriscv
CPUFAMILY=riscv
CPUFLAGS=-march=rv32i2p0_m     -mabi=ilp32 -D__vexriscv__
CPUENDIANNESS=little
CLANG=0
CPU_DIRECTORY=/home/julio/eda/litex/litex/litex/soc/cores/cpu/vexriscv
SOC_DIRECTORY=/home/julio/eda/litex/litex/litex/soc
PICOLIBC_DIRECTORY=/home/julio/eda/litex/pythondata-software-picolibc/pythondata_software_picolibc/data
COMPILER_RT_DIRECTORY=/home/julio/eda/litex/pythondata-software-compiler_rt/pythondata_software_compiler_rt/data
export BUILDINC_DIRECTORY
BUILDINC_DIRECTORY=/home/julio/eda/projetos/estudos_verilog/contador/build/sim/software/include
LIBC_DIRECTORY=/home/julio/eda/litex/litex/litex/soc/software/libc
LIBCOMPILER_RT_DIRECTORY=/home/julio/eda/litex/litex/litex/soc/software/libcompiler_rt
LIBBASE_DIRECTORY=/home/julio/eda/litex/litex/litex/soc/software/libbase
LIBFATFS_DIRECTORY=/home/julio/eda/litex/litex/litex/soc/software/libfatfs
LIBLITESPI_DIRECTORY=/home/julio/eda/litex/litex/litex/soc/software/liblitespi
LIBLITEDRAM_DIRECTORY=/home/julio/eda/litex/litex/litex/soc/software/liblitedram
LIBLITEETH_DIRECTORY=/home/julio/eda/litex/litex/litex/soc/software/libliteeth
LIBLITESDCARD_DIRECTORY=/home/julio/eda/litex/litex/litex/soc/software/liblitesdcard
LIBLITESATA_DIRECTORY=/home/julio/eda/litex/litex/litex/soc/software/liblitesata
BIOS_DIRECTORY=/home/julio/eda/litex/litex/litex/soc/software/bios
LTO=0
BIOS_CONSOLE_FULL=1