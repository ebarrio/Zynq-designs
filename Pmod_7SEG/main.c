#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "sleep.h"
#include "AXI_7SEG.h"
#include "xparameters.h"
int main()
{
	u8 count = 0;

    init_platform();

    print("Hello World\n\r");
    while(1){
    	sleep(1);
    	count ++;
    	if (count > 0xF) count = 0;
    	AXI_7SEG_mWriteReg(XPAR_AXI_7SEG_0_S00_AXI_BASEADDR, 0, count);
    }
    cleanup_platform();
    return 0;
}
