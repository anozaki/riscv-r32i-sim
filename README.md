# riscv simulation

I'm playing around with different simulator and language based VLD/Verilog. 
This is my attempt at getting RISC-V running on these different platform.

I've played with the following simulator so far.

* [Digital](https://github.com/hneemann/Digital)
* [logisim-evolution](https://github.com/logisim-evolution/logisim-evolution)
* [Turing Complete (game)](https://store.steampowered.com/app/1444480/Turing_Complete/)

Some future thing I would like to play with...

* Simulator
    * VHDL - maybe add into Digital/Logisim
    * Verilog - to learn both world
* Hardware
    * FPGA - Intel Cyclone V (Analague Pocket)
    * FPGA - iCE40 HX (Alchitry Cu)

## Platforms

### Digital

> TODO

* Pros
    * Pretty accurate simulation
    * Lot of components
    * Fast
    * Debug/Test interface
* Cons
    * Interface does not feel natural
    * Little-bit of learning curve to get going

### Logisim Evolution

> TODO

* Pros
    * Decent UI interface
    * Lot of components
    * Debug tools are great
* Cons
    * Always running does make things hard at times

### Turing Complete

* r32i implementation
    * 32 registers (x0 to x31)
    * 

> TODO

* Pros
    * Easy to get started
    * UI interface is pretty smooth
    * Mouse interaction feels pretty natural
* Cons
    * Simplifies circuit quite a bit
    * Limited components
    * Limited interaction with advanced component
    * Have to place wire everywhere (no tunnel)

## Toolchain

Easiest is to use xpack and install the gcc toolchain.

```bash
xpm install
```

https://xpack.github.io/riscv-none-elf-gcc/

## Compile

```bash
mkdir build
cd build
cmake ..
make
```

## Acknowledgement/Resources

Some resource I used to get this project up and running.

* https://twilco.github.io/riscv-from-scratch/2019/03/10/riscv-from-scratch-1.html
* https://blog.prydt.xyz/posts/installing-riscv-spike-simulator/
* https://five-embeddev.com/baremetal/cmake/
* https://www.youtube.com/playlist?list=PLilenfQGj6CEG6iZ4TQJ10PI7pCWsy1AO
* https://www.youtube.com/watch?v=5aafG5mjZ_Y
