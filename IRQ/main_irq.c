#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"

#include "sleep.h"
#include "xparameters.h"
#include "xscugic.h"
#include "xil_exception.h"

#define INTC_INTERRUPT_ID  61  // IRQ [0]
#define INTC XScuGic
#define INTC_HANDLER XScuGic_InterruptHandler
#define INTC_DEVICE_ID XPAR_PS7_SCUGIC_0_DEVICE_ID

static INTC Intc;

void PIsr(void *InstancePtr){    // INTERRUPT SERVICE ROUTINE(ISR)
    xil_printf("Received");
    sleep(1);
}

int SetupInterruptSystem()  {
    int result;
    XScuGic *IntcInstancePtr = &Intc;
    XScuGic_Config *IntcConfig;

    IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
    if (IntcConfig == NULL)    {
        return XST_FAILURE;
    }
    result = XScuGic_CfgInitialize(IntcInstancePtr, IntcConfig, IntcConfig->CpuBaseAddress);
    if (result != XST_SUCCESS)    {
        return XST_FAILURE;
    }
    /* Connect the interrupt handler */
    result = XScuGic_Connect(IntcInstancePtr, INTC_INTERRUPT_ID, (Xil_ExceptionHandler) PIsr, 0);
    if (result != XST_SUCCESS)    {
        return result;
    }

    XScuGic_SetPriorityTriggerType(IntcInstancePtr, INTC_INTERRUPT_ID, 0xA0, 0x3);// 0x3 is trigger to rising edge

    /* Enable the interrupt for the controller device. */
    XScuGic_Enable(IntcInstancePtr, INTC_INTERRUPT_ID);

    /* Enable interrupts in the ARM*/
    Xil_ExceptionInit();
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
        (Xil_ExceptionHandler)INTC_HANDLER, IntcInstancePtr);

    Xil_ExceptionEnable();    /* Enable non-critical exceptions */

    return XST_SUCCESS;
}

int main(void)  {
    int status = XST_SUCCESS;

    status = SetupInterruptSystem();
    if (status != XST_SUCCESS)   {
           return XST_FAILURE;
    }

    print("Hola\n");
    while(1);
    return 0;
}
