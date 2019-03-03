/*
 * main.c: simple BRAM test application
 * This application test synthesize BRAM at ARTIX-7 FPGA integrated on ZedBoard
 Author: Eladio Barrio Querol
 */

#include <stdio.h>
#include "platform.h"
#include "xil_io.h"
#include "xparameters.h"
#include "xil_printf.h"

#define BYTES_BRAM XPAR_AXI_BRAM_CTRL_0_S_AXI_HIGHADDR - XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR
#define BYTES_DATA sizeof(unsigned short)
int main()
{
	//unsigned short data_bram [BYTES_BRAM/BYTES_DATA];
    init_platform(); //Enable caches and uart
    unsigned int bytesBRAM = BYTES_BRAM;
	for (int i = 0 ; i < (XPAR_AXI_BRAM_CTRL_0_S_AXI_HIGHADDR - XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR) ; i+=2){
	Xil_Out16(XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + i, i); //Write in BRAM test data
	xil_printf("%x\n\r", Xil_In16(XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + i));
	}
	xil_printf("Bytes BRAM: %u\n\r", bytesBRAM);
    cleanup_platform();
    return 0;
}

