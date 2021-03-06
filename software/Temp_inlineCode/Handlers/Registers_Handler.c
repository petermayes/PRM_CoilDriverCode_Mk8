/*
 * msgDMA_Handler.c
 *
 *  Created on: 8 Jun 2019
 *      Author: prm
 */


#include "system.h"
#include "alt_types.h"

#include "..\Includes\Types.h"
#include "..\Handlers\CurrentCTRL_Handler.h"
#include "..\Handlers\Registers_Handler.h"


#include <string.h>  //needed for memcpy

DataDictionary Registers __attribute__ ((section (".Register_DataSpace")));
//Uint32 ExtendedMemoryLocation[1] __attribute__ ((section (".Second_Data_Memory_Page")));
Uint32 CurrCTRLDebugdata[1] __attribute__ ((section (".Second_Data_Memory_Page")));

char*	SecondTextArea[FIRST_TEXT_AREA_BYTES]__attribute__((section(".SecondTextArea"))); // __attribute__ ((aligned(0x10)));
char*	FirstTextArea[FIRST_TEXT_AREA_BYTES]__attribute__((section(".FirstTextArea"))); // __attribute__ ((aligned(0x10)));


/* -------------------------------------------------------------------------
 * Process a received interrupt. Interrupts are generated when a transaction
 * completes.
 -------------------------------------------------------------------------- */
int Init_Register_Module(Uint32 Slot_Address, float SoftwareVersionNumber)
{
char* first_text_area = "First Text Area";
char* second_text_area = "Second Text Area";
float* ptr2float;

	memcpy(&FirstTextArea[0], first_text_area, 15);
	memcpy(&SecondTextArea[0], second_text_area, 16);

	CurrCTRLDebugdata[0] = 0;

	Registers.Node_Address.DataField = Slot_Address; //4;
//	Registers.Node_Address.ReadWriteFlag = READ_ONLY;  // defaults to zero - READ_ONLY
//	Registers.Node_Address.DataType = UINT32;

	ptr2float = &SoftwareVersionNumber;
	Registers.SoftwareVersion.DataField = *((int32*)(ptr2float));
//	Registers.SoftwareVersion.ReadWriteFlag = READ_ONLY;

	Registers.SoftwareVersion.DataType = SINGLE;
	Registers.DataInterfaceOperatingMode.DataType = DATA_INTERFACE_OPERATING_MODE;
	Registers.PatternDataModeOperatingState.DataType = PATTERN_DATA_MODE_STATE;
	Registers.DDR3_StatusFlag.DataType = PASS_FAIL;
	Registers.DMA_StatusWord.DataType = DMA_STATUS_FLAGS;
	Registers.Flash_Update_Mode.DataType = FIRMWARE_MODE_STATES;
	Registers.Patterngenerator_Embedded_State.DataType = PATTERN_EMBEDDED_STATE;
	Registers.Patterngenerator_FPGA_State.DataType = PATTERN_FPGA_STATE;
	Registers.Patterngenerator_FIFO_Read_State.DataType = PATTERN_FPGA_FIFO_READ_STATE;

	Registers.Patterngenerator_New_X_Position.DataType = INT32;
	Registers.Patterngenerator_New_Y_Position.DataType = INT32;
	Registers.Patterngenerator_X_Increment.DataType = INT32;
	Registers.Patterngenerator_Y_Increment.DataType = INT32;
	Registers.Patterngenerator_TimeDifference.DataType = INT32;

	Registers.CurrCTRL_Data1.DataType = INT32;



	Registers.Debug_2.DataType = INT32;
	Registers.Debug_5.DataType = INT32;

/*	ptr2Uint32 = &ExtendedMemoryLocation[0];

	for (Count = 0; Count < (5 * 1024); Count++)
	{
	//	ExtendedMemoryLocation[Count] = Count * (Slot_Address + 1);  // gives an warning
		*(ptr2Uint32 + Count) = Count + (Slot_Address * 10000);
	}
*/
	return 0;
}

/*******************************************************************************
* InterpFnc                                                                    *
*   Parameter:                                                                 *
*   Return:                                                                    *
*******************************************************************************/
void ClearDriveStateRequest(void)
{
	Registers.CurrCTRL_DriveStateDemand.DataField = 32;
}

/*******************************************************************************
* InterpFnc                                                                    *
*   Parameter:                                                                 *
*   Return:                                                                    *
*******************************************************************************/
void UpdateControlLoopFPGA_Parameters(void)
{
//static float Tempfloat = 1.1f;


}

/*******************************************************************************
* InterpFnc                                                                    *
*   Parameter:                                                                 *
*   Return:                                                                    *
*******************************************************************************/
void UpdateRegisterData(Uint32* ptr2Data)
{
Uint32 TargetRegister;
Uint16 Register_Type, Register_ReadWriteFlag;
Uint32* ptr2_register;

	TargetRegister = *(ptr2Data + 0);
	Registers.Command_1.DataField = TargetRegister;

	ptr2_register = (Uint32*)&Registers;
	ptr2_register += (TargetRegister * 2);

	Register_ReadWriteFlag = (Uint16)*(ptr2_register + 1);
	Register_Type = (Uint16)(*(ptr2_register + 1) >> 16);

	if (Register_ReadWriteFlag == READ_WRITE)
		{
			if (*(ptr2Data + 2) == Register_Type)
				{
					*ptr2_register = *(ptr2Data + 1);
				}
		}
}

/*******************************************************************************
* InterpFnc                                                                    *
*   Parameter:                                                                 *
*   Return:                                                                    *
*******************************************************************************/
void InputDemandHandler(ControlModuleDataStruc* ptr2data)
{
	ptr2data->InputDemand_Data.DriveStateDemand = (Uint16)Registers.CurrCTRL_DriveStateDemand.DataField;
	ptr2data->InputDemand_Data.ControlModeRequest = (Uint16)Registers.CurrCTRL_ControlModeDemand.DataField;
}

/* ----------------------- */
