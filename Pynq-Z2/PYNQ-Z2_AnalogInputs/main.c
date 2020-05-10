
/***************************** Include Files ********************************/

#include <stdio.h>
#include "stdio.h"
#include "platform.h"
#include "xil_printf.h"
#include "xadcps.h"
#include "xparameters.h"
#include "xstatus.h"
#include "sleep.h"

/************************** Constant Definitions ****************************/

#define XADC_DEVICE_ID 		XPAR_XADCPS_0_DEVICE_ID



/***************** Macros (Inline Functions) Definitions ********************/

#define printf xil_printf /* Small foot-print printf function */



/************************** Function Prototypes *****************************/

static int XAdcPolledPrintfExample(u16 XAdcDeviceId);
static int XAdcFractionToInt(float FloatNum);


/************************** Variable Definitions ****************************/

static XAdcPs XAdcInst;      /* XADC driver instance */




/****************************************************************************/
/**************************        MAIN         *****************************/
/****************************************************************************/

int main()
{
    init_platform();
    print("ADC Test: Starting Program \n\r");

    int Status;
    /*
     * Run the polled example, specify the Device ID that is
     * generated in xparameters.h.
     */
    Status = XAdcPolledPrintfExample(XADC_DEVICE_ID);
    if (Status != XST_SUCCESS) {
    	return XST_FAILURE;
    }

    print("ADC Test: Finishing Program \n\r");
    cleanup_platform();
    return XST_SUCCESS;
}



int XAdcPolledPrintfExample(u16 XAdcDeviceId)
{
	int Status;
	XAdcPs_Config *ConfigPtr;
	u32 TempRawData;
	u32 VccPintRawData;
	u32 VccPauxRawData;
	u32 VccPdroRawData;
	float TempData;
	float VccPintData;
	float VccPauxData;
	float MaxData;
	float MinData;
	XAdcPs *XAdcInstPtr = &XAdcInst;

	printf("	Entering the XAdc Polled Example. ");

	/*
	 * Initialize the XAdc driver.
	 */
	ConfigPtr = XAdcPs_LookupConfig(XAdcDeviceId);
	if (ConfigPtr == NULL) {
		return XST_FAILURE;
		printf("XAdcPs_LookupConfig() returns XST_FAILURE");
	}
	XAdcPs_CfgInitialize(XAdcInstPtr, ConfigPtr, ConfigPtr->BaseAddress);

	Status = XAdcPs_SelfTest(XAdcInstPtr);
	if (Status != XST_SUCCESS) {
		printf("rXAdcPs_SelfTest() returns XST_FAILUREr");
		return XST_FAILURE;
	}

	XAdcPs_SetSequencerMode(XAdcInstPtr, XADCPS_SEQ_MODE_CONTINPASS);

	int adc_chanels [6] = {1,9,6,15,5,13};
	// CUSTOMIZED PART
	while(1){
		XAdcPs_Reset(XAdcInstPtr);
		printf("\n\r   ----- New samples -----   \n\r");
		for(int i = 0; i < 6 ; i++){
			VccPintRawData = XAdcPs_GetAdcData(XAdcInstPtr, XADCPS_CH_AUX_MIN + adc_chanels[i]);
			VccPintData = XAdcPs_RawToVoltage(VccPintRawData);
			printf("%0d.%03d Volts.\n\r", (int)(VccPintData), XAdcFractionToInt(VccPintData));
		}
		sleep(5);
	}
	printf("Exiting the XAdc Polled Example.");
	return XST_SUCCESS;
}


int XAdcFractionToInt(float FloatNum)
{
	float Temp;

	Temp = FloatNum;
	if (FloatNum < 0) {
		Temp = -(FloatNum);
	}
	return( ((int)((Temp -(float)((int)Temp)) * (1000.0f))));
}

