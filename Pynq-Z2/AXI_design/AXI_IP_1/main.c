#include "platform.h"
#include "xbasic_types.h"
#include "xparameters.h"
#include "xil_printf.h"
Xuint32 *axi_write_addr_p = (Xuint32 *)XPAR_PYNQ_AXI_IP_0_SW_AXI_BASEADDR;
Xuint32 *axi_read_addr_p = (Xuint32 *)XPAR_PYNQ_AXI_IP_0_SR_AXI_BASEADDR;
int main()
{
init_platform();
xil_printf(" AXI Test on PYNQ-Z2\n\r");
// Write in AXI SW port
*(axi_write_addr_p+0) = 0x01234567;
*(axi_write_addr_p+1) = 0x76543210;
xil_printf("Wrote 1: 0x%08x \n\r", *(axi_write_addr_p+0));
xil_printf("Wrote 2: 0x%08x \n\r", *(axi_write_addr_p+1));
// Read from AXI SR port
xil_printf("Read 1 at same port: 0x%08x \n\r", *(axi_read_addr_p+0));
xil_printf("Read 2 at same port: 0x%08x \n\r", *(axi_read_addr_p+1));
xil_printf("End of test\n\n\r");

return 0;
}
