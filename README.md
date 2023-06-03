# 🌍 InfinityX-OS 🌍
 <b>`This is a custom OS made with x86 Assembly and C.`<br><br></b>
 Please Check [Releases](https://github.com/PranavVerma-droid/InfinityX-OS/releases) For the Latest Compiled Version of this OS. <br><br>
 This Code has been  [licensed](https://github.com/PranavVerma-droid/InfinityX-OS-Assembly-C/blob/main/LICENSE).<br>
 Made By - [PranavVerma-droid](https://web.craftingrealm.tk). <br><br>

 Currently, This OS can run on <b>any x86 processor</b>. <br>
Some BIOS Versions might not Be Compatable.<br><br>
 
 
 ## Dependencies & Installation
**These are the Current Dependencies Required to Run InfinityX OS**:

```sh
# Ubuntu, Debian:
sudo apt install build-essential bison flex libgmp3-dev libmpc-dev libmpfr-dev texinfo wget \
                   nasm mtools python3 python3-pip python3-parted scons dosfstools libguestfs-tools qemu-system-x86

# Fedora:
sudo dnf install gcc gcc-c++ make bison flex gmp-devel libmpc-devel mpfr-devel texinfo wget \
                   nasm mtools python3 python3-pip python3-pyparted python3-scons dosfstools guestfs-tools qemu-system-x86

# Arch & Arch-based:
paru -S gcc make bison flex libgmp-static libmpc mpfr texinfo nasm mtools qemu-system-x86 python3 scons
```
NOTE: to install all the required packages on Arch, you need an [AUR helper](https://wiki.archlinux.org/title/AUR_helpers).

Then you must run `python3 -m pip install -r requirements.txt`

Next, modify the configuration in `build_scripts/config.py`. The most important is the `toolchain='/../../toolchains'` option which sets where the toolchain will be downloaded and built. The default option is in the directory above where the repo is cloned, in a .toolchains directory, but you will get an error if this directory doesn't exist.

After that, run `scons toolchain`, this should download and build the required tools (binutils and GCC). If you encounter errors during this step, you might have to modify `scripts/setup_toolchain.sh` and try a different version of **binutils** and **gcc**. Using the same version as the one bundled with your distribution is your best bet.

Finally, you should be able to run `scons`. Use `scons run` to test your OS using qemu. <br>
If you Encounter Any Issues while Running `scons run`, try giving the `scripts/run.sh` script full Perrmission Using `chmod +x <script-path-here.sh>` <br>
P.S. - You don't have to run `scons run` everytime to just test and run the OS! You can run just the `run script` located at [`OS-Files/InfinityX/scripts/run.sh`](OS-Files/InfinityX/scripts/run.sh). Run the Command like this - `./run.sh <image type> <image location>` Example: `./run.sh disk build/image.img`. Run `scons run` only when you have to Compile the OS.

(I have Written a [Custom Script](https://github.com/PranavVerma-droid/InfinityX-OS/blob/main/OS-Files/InfinityX/install.sh) to Automate this Process. When You have downloaded all the Base Files, Just run `bash install.sh` in the Base Directory, i.e. `InfinityX` Folder, it will Install Everything for You.)

For Windows, it is Recommended to Download VCXSRV - https://sourceforge.net/projects/vcxsrv/ (On Windows).
 
 ## Commands
**Here are the Different Commands that you might Need to Run/Debux InfinityX OS**: <br>
(Make sure to Download the [**Dependencies**](https://github.com/PranavVerma-droid/InfinityX-OS#dependencies--installation) First)

1. Compile && Run the OS - `scons run`
2. Only Run the OS - `./scripts/run.sh disk build/i686_debug/image.img` (After Compiling with `scons run`)
3. Debug (Bochs) - `scons debug`
4. Install Toolchain (GCC, BinUTILS) - `scons toolchain`
5. Install all Dependencies (Ubuntu/Debian ONLY!) - `sudo bash install.sh`



Optional:
1. WSL Filesystem Access - `//wsl$` (Paste this in any File Explorer Window)
 


## Documentation
**Here are the Sources that I used to make this OS**:

1. https://wiki.osdev.org/FAT - Fat File System
2. https://www.stanislavs.org/helppc/int_13.html - Int13h
3. https://c9x.me/x86/ - x86 Instructions
4. https://en.wikipedia.org/wiki/Cylinder-head-sector - Cylinder Heard Sector
5. https://en.wikipedia.org/wiki/Logical_block_addressing#CHS_conversion - CHS -> LBA Conversion
6. https://ubuntu.com/tutorials/install-ubuntu-on-wsl2-on-windows-10 - Install WSL and Ubuntu
7. Compilers:
   1. OpenWatCom - https://github.com/open-watcom/open-watcom-v2
   2. Digital Mars - https://digitalmars.com/download/freecompiler.html
8. https://en.wikipedia.org/wiki/X86_calling_conventions - Calling Conversions (x86)
9. http://www.ctyme.com/rbrown.htm - Ralf Brown's Interrupt List
10. http://www.ctyme.com/intr/rb-0106.htm - Int 10/AH=0Eh
11. https://bochs.sourceforge.io - Bochs
12. https://www.gnu.org/software/mtools/ - Mtools
13. https://gcc.gnu.org/onlinedocs/gccint/Libgcc.html - LibGCC
14. https://wiki.osdev.org/GCC_Cross-Compiler - GCC Cross Compiler
15. https://wiki.osdev.org/LLVM_Cross-Compiler - LLVM Cross Compiler
16. https://techcommunity.microsoft.com/t5/modern-work-app-consult-blog/running-wsl-gui-apps-on-windows-10/ba-p/1493242 - Setting up a WSL
17. https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html - Intel Manuals
18. https://wiki.osdev.org/Interrupts - Interrupts
19. https://wiki.osdev.org/8259_PIC - PIC
20. https://pdos.csail.mit.edu/6.828/2005/readings/hardware/8259A.pdf - PIC Datasheet


## Explanation

So, What Happens when you Turn On your Computer? This is what Happens - 

1. BIOS is copied from a ROM chip into RAM
2. BIOS starts executing code
   - Initializes hardware
     - Runs some tests (POST = power-on self test)
3. BIOS searches for an operating system to start
4. BIOS loads and starts the operating system
5. Operating system runs

Methods of Booting into an OS:
1. Legacy Booting:

- BIOS loads first sector of each bootable device into memory (at location 0x7C00)
- BIOS checks for 0xAA55 signature
- If found, it starts executing code

2. EFI:

- BIOS looks into special EFI partitions
- Operating system must be compiled as an EFI
program

(This OS Uses `Legacy Booting`)

Now that we know how the bios loads our operating system here's what we need to do we will write some code assemble it and then we will put it in the first sector of a floppy disk we also need to somehow add that signature that the bios requires after that we can test our  operating system.

we know that the bios always puts our operating system at address 7c00 so the first thing we need to do is give our sender this information this is done using the org directive which tells the assembler to calculate all memory offset starting at 7c00 changing this line to another number won't make the bios load a different address it will only tell the assembler that the variables and labels from our code should be calculated with the offset 7c00.

A directive is a way of giving the assembler a clue about how to interpret our code when instruction is translated into a machine code instruction a directive won't get translated it is only giving a clue to the assembler.

```asm
org 0x7C00
bits 16
```

Bits - we tell our assembler to emit 16-bit code as I mentioned before any x86 CPU must be backwards compatible with the original 8086 CPU so if an operating system that was designed for the 8086 is run on a modern CPU it still needs to think that it's running on an 8086 because of this the CPU always starts in 16-bit mode bits is also a directive which tells the assembler to emit 16-bit code writing bits 32 won't make the processor running 32-bit mode it is only directive which tells the assembler to emit 32-bit code.

```asm
org 0x7C00
bits 16

main:
    hlt
.halt:
    jmp .halt
```

Main- This is where our OS Starts from
.halt - This is a Function that Jumps to Itself for a Infinite Loop. (So that the CPU does NOT start up again.)

The signature that the BIOS requires the BIOS expects that the last two bytes of the first sector are a a 5 5 we will be putting our program on a standard 1.44 megabytes floppy disk where one sector has 512 bytes the BIOS requires that the last 2 bytes of the first sector are a a 5 5 we can ask Nasm to emit byte directly by using the DB directive which stands for declare constant byte the times directive can be used to repeat instructions or data.

... And the Journey Begins ...

```asm
org 0x7C00
bits 16


%define ENDL 0x0D, 0x0A


start:
    jmp main


;
; Prints a string to the screen
; Params:
;   - ds:si points to string
;
puts:
    ; save registers we will modify
    push si
    push ax
    push bx

.loop:
    lodsb               ; loads next character in al
    or al, al           ; verify if next character is null?
    jz .done

    mov ah, 0x0E        ; call bios interrupt
    mov bh, 0           ; set page number to 0
    int 0x10

    jmp .loop

.done:
    pop bx
    pop ax
    pop si    
    ret
    

main:
    ; setup data segments
    mov ax, 0           ; can't set ds/es directly
    mov ds, ax
    mov es, ax
    
    ; setup stack
    mov ss, ax
    mov sp, 0x7C00      ; stack grows downwards from where we are loaded in memory

    ; print hello world message
    mov si, msg_hello
    call puts

    hlt

.halt
    jmp .halt



msg_hello: db 'Hello world!', ENDL, 0


times 510-($-$$) db 0
dw 0AA55h
```
    
