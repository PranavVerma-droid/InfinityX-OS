#include <stdint.h>
#include "stdio.h"
#include "memory.h"
#include <hal/hal.h>
#include <arch/i686/irq.h>
#include <debug.h>
#include <boot/bootparams.h>

extern void _init();

void crash_me();

void timer(Registers* regs)
{
    printf(".");
}

void start(BootParams* bootParams)
{   
    // call global constructors
    _init();

    HAL_Initialize();

    log_debug("Main", "Boot device: %x", bootParams->BootDevice);
    log_debug("Main", "Memory region count: %d", bootParams->Memory.RegionCount);
    for (int i = 0; i < bootParams->Memory.RegionCount; i++) 
    {
        log_debug("Main", "MEM: start=0x%llx length=0x%llx type=%x", 
            bootParams->Memory.Regions[i].Begin,
            bootParams->Memory.Regions[i].Length,
            bootParams->Memory.Regions[i].Type);
    }

    log_info("Info", "This (Info) Message has been Received From the OS!");
    log_info("Main", "This (Main) Message has been Received From the OS!");
    log_warn("Warn", "This (Warn) Message has been Received From the OS!");
    log_err("Error", "This (Error) Message has been Received From the OS!");
    log_crit("Main", "This (Critical) Message has been Received From the OS!");

    
    printf("InfinityX OS V1.6\n\n");
    printf("Kernel Has Loaded!\nError Message(s) Sent Successfully! (To the Terminal)");
    //i686_IRQ_RegisterHandler(0, timer);

    //crash_me();

end:
    for (;;);
}
