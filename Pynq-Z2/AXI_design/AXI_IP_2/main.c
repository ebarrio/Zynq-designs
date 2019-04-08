
#include <stdio.h>
#include "xil_printf.h"
#include "platform.h"
#include "xbasic_types.h"
#include "xparameters.h"

Xuint32 *baseaddr_p = (Xuint32 *)XPAR_PYNQ_AXI_TEST2_0_S00_AXI_BASEADDR;

int main()
{
init_platform();
xil_printf("AXI Test\n\r");
xil_printf("0 1 Read/Write reg\n\r");
xil_printf("2 3 Read reg hardware fixed\n\r");
// Write  inputs
*(baseaddr_p+0) = 0x00000000;
*(baseaddr_p+1) = 0xFFFFFFFF;
xil_printf("Wrote0 : 0x%08x \n\r", *(baseaddr_p+0));
xil_printf("Wrote1 : 0x%08x \n\r", *(baseaddr_p+1));
// Read  outputs
xil_printf("Read writed 0: 0x%08x \n\r", *(baseaddr_p+0));
xil_printf("Read writed 1: 0x%08x \n\r", *(baseaddr_p+1));
xil_printf("Read prefix 0: 0x%08x \n\r", *(baseaddr_p+2));
xil_printf("Read prefix 1: 0x%08x \n\r", *(baseaddr_p+3));
// Probably fail at hexadecimal reg assign (Good way: 'h0A)
xil_printf("End of test\n\n\r");

return 0;
}
