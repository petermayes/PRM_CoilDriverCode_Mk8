/*
 * FT600_Driver.c
 *
 *  Created on: 15 Jan 2017
 *      Author: prm
 */

#include <string.h>

#include "system.h"
#include "alt_types.h"
#include "sys\alt_irq.h"
#include "altera_avalon_pio_regs.h"  // needed for the FT600 GPIO Lines


#include "..\Includes\Types.h"
#include "..\Handlers\USB_Data_Handler.h"
#include "..\Handlers\CurrentCTRL_Handler.h"
#include "..\Handlers\Registers_Handler.h"
#include "..\Handlers\DDR3_Handler.h"
//#include "..\Handlers\Flash_RemoteUpdateHandler.h"

static Uint32 PatternDataModeStatemachine(void);
Uint32 FT_600_CommsHandler(void);

static int32 USB_Data_CommsState = FT_600_ENTRY;
static Uint32	DataInterfaceOperatingState = DATA_INTERFACE_RESET_STATE;
static Uint32	PatternDataOperatingState = PATTERN_DATA_RESET_STATE;


/*******************************************************************************
 * int main()                                                                  *
 *                                                                             *
 ******************************************************************************/
void DataInterfaceOperatingModeStatemachine(void)
{

	Registers.DataInterfaceOperatingMode.DataField = DataInterfaceOperatingState;
	Registers.PatternDataModeOperatingState.DataField = PatternDataOperatingState;
	Registers.Flash_Update_Mode.DataField = USB_Data_CommsState;
//	Registers.Debug_0.DataField = USB_Data_CommsState;


	switch (DataInterfaceOperatingState)
		{
			case DATA_INTERFACE_RESET_STATE:
				DataInterfaceOperatingState = DATA_INTERFACE_IDLE_STATE;
				break;
/*******************************************************************************/
			case DATA_INTERFACE_IDLE_STATE:
				if (strcmp((char*)&FirstTextArea[0], "Set Pattern Data Mode") == 0)
					DataInterfaceOperatingState = DATA_INTERFACE_PATTERN_DATA_STATE;

				if (strcmp((char*)&FirstTextArea[0], "Set Table Data Update Mode") == 0)
					DataInterfaceOperatingState = DATA_INTERFACE_TABLE_UPDATE_STATE;

				if (strcmp((char*)&FirstTextArea[0], "Set Firmware Update Mode") == 0)
					DataInterfaceOperatingState = DATA_INTERFACE_FIRMWARE_UPDATE_STATE;

				if (strcmp((char*)&FirstTextArea[0], "Set Node Data Copy Mode") == 0)
					DataInterfaceOperatingState = DATA_INTERFACE_NODE_COPY_MODE_STATE;

				break;
/*******************************************************************************/
			case DATA_INTERFACE_PATTERN_DATA_STATE:
				if (PatternDataModeStatemachine() == PATTERN_DATA_IDLE_STATE)
					{
						if (strcmp((char*)&FirstTextArea[0], "Return to IDLE Mode") == 0)
							DataInterfaceOperatingState = DATA_INTERFACE_IDLE_STATE;
					}
				break;
/*******************************************************************************/
			case DATA_INTERFACE_FIRMWARE_UPDATE_STATE:
				if (FT_600_CommsHandler() == FT_READY_TO_ACQUIRE_STATE)
					{
						if (strcmp((char*)&FirstTextArea[0], "Return to IDLE Mode") == 0)
							DataInterfaceOperatingState = DATA_INTERFACE_IDLE_STATE;
					}
				break;
/*******************************************************************************/
			case DATA_INTERFACE_TABLE_UPDATE_STATE:
			case DATA_INTERFACE_NODE_COPY_MODE_STATE:
				if (strcmp((char*)&FirstTextArea[0], "Return to IDLE Mode") == 0)
					DataInterfaceOperatingState = DATA_INTERFACE_IDLE_STATE;
				break;
/*******************************************************************************/
			default:
				break;
		}

}


/*******************************************************************************
 * int main()                                                                  *
 *                                                                             *
 ******************************************************************************/
static Uint32 PatternDataModeStatemachine(void)
{
	Registers.Patterngenerator_Embedded_State.DataField = PatternDataOperatingState;


	switch (PatternDataOperatingState)
		{
			case PATTERN_DATA_RESET_STATE:
				PatternDataOperatingState = PATTERN_DATA_IDLE_STATE;
				break;
/*******************************************************************************/
			case PATTERN_DATA_IDLE_STATE:
				if (strcmp((char*)&FirstTextArea[0], "Set Pattern Data  Download Mode") == 0)
					PatternDataOperatingState = PATTERN_DATA_DOWNLOAD_DATA_STATE;

				if (strcmp((char*)&FirstTextArea[0], "Set Pattern Data Mode to RUN") == 0)
					PatternDataOperatingState = PATTERN_DATA_RUN_AND_BSD_IDLE_STATE;

				break;

/*******************************************************************************/
			case PATTERN_DATA_DOWNLOAD_DATA_STATE:

				if (strcmp((char*)&FirstTextArea[0], "Pattern Mode Idle State Req") == 0)
					PatternDataOperatingState = PATTERN_DATA_IDLE_STATE;
				if (strcmp((char*)&FirstTextArea[0], "CRC Pattern Data Flash Area") == 0)
					PatternDataOperatingState = PATTERN_DATA_CRC_CHECK_STATE;

				break;

/*******************************************************************************/

			case PATTERN_DATA_RUN_AND_BSD_IDLE_STATE:

				if (strcmp((char*)&FirstTextArea[0], "Pattern Mode Idle State Req") == 0)
					PatternDataOperatingState = PATTERN_DATA_IDLE_STATE;

				if (strcmp((char*)&FirstTextArea[0], "Pattern Normal Mode Preload State Req") == 0)
					PatternDataOperatingState = PATTERN_DATA_PRELOAD_STATE;

				break;

/*******************************************************************************/

			case PATTERN_DATA_PRELOAD_STATE:

				if (strcmp((char*)&FirstTextArea[0], "Pattern Normal Mode IDLE State Req") == 0)
					PatternDataOperatingState = PATTERN_DATA_RUN_AND_BSD_IDLE_STATE;

				if (strcmp((char*)&FirstTextArea[0], "Pattern Normal Mode RUN State Req") == 0)
					PatternDataOperatingState = PATTERN_DATA_NORMAL_RUN_STATE;

				break;

/*******************************************************************************/

			case PATTERN_DATA_NORMAL_RUN_STATE:

				if (strcmp((char*)&FirstTextArea[0], "Pattern Normal Mode IDLE State Req") == 0)
					PatternDataOperatingState = PATTERN_DATA_RUN_AND_BSD_IDLE_STATE;

				break;

/*******************************************************************************/
			case PATTERN_DATA_CRC_CHECK_STATE:

			//	Registers.DDR3_CRC_Value.DataField = CalculateCRC_Value(4096*4096);
				PatternDataOperatingState = PATTERN_DATA_CRC_WAIT_STATE;

				break;

/*******************************************************************************/
			case PATTERN_DATA_CRC_WAIT_STATE:
				if (strcmp((char*)&FirstTextArea[0], "CRC Pattern Data ACK") == 0)
					PatternDataOperatingState = PATTERN_DATA_IDLE_STATE;

				break;
/*******************************************************************************/
			default:
				break;
		}

return PatternDataOperatingState;
}

/*******************************************************************************
 * int main()                                                                  *
 *                                                                             *
 ******************************************************************************/
Uint32 GetPatternDataOperatingState(void)
{
return PatternDataOperatingState;
}

/*******************************************************************************
 * int main()                                                                  *
 *                                                                             *
 ******************************************************************************/
Uint32 FT_600_CommsHandler(void)
{
	return USB_Data_CommsState;
}

#if 0

/*******************************************************************************
 * int main()                                                                  *
 *                                                                             *
 ******************************************************************************/
int32 USB_Data_CommsHandler(int16 USB_Request_Flag)
{
FlashProgramming_Response	ReturnData;

	switch (USB_Data_CommsState)
		{
			case FT_600_ENTRY:

				USB_Data_CommsState = FT_READY_TO_ACQUIRE_STATE;

				break;

	/* ---------------------------------------------------------------------------------------------------*/
	/* ---------------------------------------------------------------------------------------------------*/

			case FT_READY_TO_ACQUIRE_STATE:

				ReturnData = FlashHandler(FLASH_STATE_RESET_REQUEST);
				Registers.Flash_Reprogramming_State.DataField = ReturnData.State;
				Registers.Flash_Status.DataField = ReturnData.FlashStatus;

				if (strcmp((char*)&FirstTextArea[0], "CRC USB User Flash Area") == 0)
					USB_Data_CommsState = FT_CRC_OBSERVER_USER_FLASH_DDR3_STATE;

				if (strcmp((char*)&FirstTextArea[0], "Reprogramme Inline Controller User Flash Sector 1") == 0)
					USB_Data_CommsState = FT_ERASE_USB_USER_FLASH_STATE;

				if (strcmp((char*)&FirstTextArea[0], "CRC FPGA Config Flash") == 0)
					USB_Data_CommsState = FT_CRC_FPGA_CONFIG_DDR3_STATE;

				if (strcmp((char*)&FirstTextArea[0], "Reprogramme Inline Controller Config Flash Sector") == 0)
					USB_Data_CommsState = FT_ERASE_FPGA_CONFIG_FLASH_STATE;

				if (strcmp((char*)&FirstTextArea[0], "Inline Controller Reset Request") == 0)
					USB_Data_CommsState = FT_RESET_OBSERVER_CPLD_STATE;



				break;
#if 0
	/* ---------------------------------------------------------------------------------------------------*/
	/* ---------------------------------------------------------------------------------------------------*/

			case FT_ACQUIRE_STATE:

				break;

	/* ---------------------------------------------------------------------------------------------------*/
	/* ---------------------------------------------------------------------------------------------------*/

			case FT_ERASE_USB_USER_FLASH_STATE:

				break;

	/* ---------------------------------------------------------------------------------------------------*/
	/* ---------------------------------------------------------------------------------------------------*/

			case FT_ERASE_SUPERVOSORY_USER_FLASH_STATE:

				break;

	/* ---------------------------------------------------------------------------------------------------*/
	/* ---------------------------------------------------------------------------------------------------*/

			case FT_ERASE_FPGA_CONFIG_FLASH_STATE:

				break;

	/* ---------------------------------------------------------------------------------------------------*/
	/* ---------------------------------------------------------------------------------------------------*/

			case FT_ERASE_USB_USER_FLASH_FAILED_STATE:
			case FT_ERASE_USB_USER_FLASH_SUCCESS_STATE:

				break;
#endif
	/* ---------------------------------------------------------------------------------------------------*/
	/* ---------------------------------------------------------------------------------------------------*/

			case FT_RESET_OBSERVER_CPLD_STATE:

				IOWR(DUAL_BOOT_0_BASE, 0, 0x00000001);

				break;

	/* ---------------------------------------------------------------------------------------------------*/
	/* ---------------------------------------------------------------------------------------------------*/

			case FT_CRC_OBSERVER_USER_FLASH_DDR3_STATE:

				Registers.DDR3_CRC_Value.DataField = CalculateCRC_Value(32768);
				USB_Data_CommsState = FT_WAIT_FOR_REQUEST_FLAG_TO_BE_CLEARED;

				break;

	/* ---------------------------------------------------------------------------------------------------*/
	/* ---------------------------------------------------------------------------------------------------*/

			case FT_ERASE_USB_USER_FLASH_STATE:

				ReturnData = FlashHandler(ERASE_USER_FLASH_STATE_REQUEST);
				Registers.Flash_Reprogramming_State.DataField = ReturnData.State;
				Registers.Flash_Status.DataField = ReturnData.FlashStatus;

				if (ReturnData.State == 5)
					USB_Data_CommsState = FT_ERASE_USB_USER_FLASH_SUCCESS_STATE;

				if (ReturnData.State == 20)
					USB_Data_CommsState = FT_ERASE_USB_USER_FLASH_FAILED_STATE;

				break;

	/* ---------------------------------------------------------------------------------------------------*/
	/* ---------------------------------------------------------------------------------------------------*/

			case FT_ERASE_USB_USER_FLASH_SUCCESS_STATE:
			case FT_ERASE_USB_USER_FLASH_FAILED_STATE:
			case FT_WAIT_FOR_REQUEST_FLAG_TO_BE_CLEARED:

				if (strcmp((char*)&FirstTextArea[0], "Firmware Mode Home") == 0)
					USB_Data_CommsState = FT_READY_TO_ACQUIRE_STATE;

				break;

	/* ---------------------------------------------------------------------------------------------------*/
	/* ---------------------------------------------------------------------------------------------------*/

			case FT_CRC_FPGA_CONFIG_DDR3_STATE:

				Registers.DDR3_CRC_Value.DataField = CalculateCRC_Value(688128);
				USB_Data_CommsState = FT_WAIT_FOR_REQUEST_FLAG_TO_BE_CLEARED;

				break;

	/* ---------------------------------------------------------------------------------------------------*/
	/* ---------------------------------------------------------------------------------------------------*/

			case FT_ERASE_FPGA_CONFIG_FLASH_STATE:

				ReturnData = FlashHandler(ERASE_CONFIG_FLASH_STATE_REQUEST);
				Registers.Flash_Reprogramming_State.DataField = ReturnData.State;
				Registers.Flash_Status.DataField = ReturnData.FlashStatus;


				if (ReturnData.State == 5)
					USB_Data_CommsState = FT_ERASE_USB_USER_FLASH_SUCCESS_STATE;

				if (ReturnData.State == 20)
					USB_Data_CommsState = FT_ERASE_USB_USER_FLASH_FAILED_STATE;

				break;

	/* ---------------------------------------------------------------------------------------------------*/
	/* ---------------------------------------------------------------------------------------------------*/

			default:
				break;
		}


return USB_Data_CommsState;

}

#endif

/*******************************************************************************
 * int main()                                                                  *
 *                                                                             *
 ******************************************************************************/
Uint32 Decode_USB_Text_String(void)
{
char*	ptr2text;
Uint32	ReturnValue;

	ptr2text = (char*)(&FirstTextArea[0]);  //

//	if (strcmp(ptr2text, "DAQ Reset") == 0)
//		ReturnValue = FT_RESET_STATE;

	if (strcmp(ptr2text, "DAQ Stop") == 0)
		ReturnValue = FT_READY_TO_ACQUIRE_STATE;

/*	if (strcmp(ptr2text, "DAQ Start") == 0)
		ReturnValue = FT_ACQUIRE_STATE;

	if (strcmp(ptr2text, "USB Controller Program Update") == 0)
		ReturnValue = FT_ERASE_USB_USER_FLASH_STATE;

	if (strcmp(ptr2text, "Erase USB User Flash Area") == 0)
		ReturnValue = FT_ERASE_USB_USER_FLASH_STATE;

	if (strcmp(ptr2text, "Erase Supervisory User Flash") == 0)
		ReturnValue = FT_ERASE_SUPERVOSORY_USER_FLASH_STATE;

*/

	if (strcmp(ptr2text, "Observer Reset") == 0)
		ReturnValue = FT_RESET_OBSERVER_CPLD_STATE;

//	if (strcmp(ptr2text, "Observer ConfigFlashProg") == 0)
//		ReturnValue = FT_ERASE_OBSERVER_CONFIG_FLASH_STATE;

	if (strcmp(ptr2text, "CRC 688128 Bytes") == 0)
		ReturnValue = FT_CRC_OBSERVER_CONFIG_FLASH_DDR3_STATE;

	if (strcmp(ptr2text, "CRC 32768 Bytes") == 0)
		ReturnValue = FT_CRC_OBSERVER_USER_FLASH_DDR3_STATE;

	if (strcmp(ptr2text, "Erase Observer User Flash") == 0)
		ReturnValue = FT_ERASE_OBSERVER_USER_FLASH_STATE;


	return ReturnValue;
}



/* -------------------------------- eof ------------------------------ */


