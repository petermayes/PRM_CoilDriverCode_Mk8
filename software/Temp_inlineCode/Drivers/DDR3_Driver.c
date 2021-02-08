/*
 * DDR3_Driver.c
 *
 *  Created on: 7 Jun 2019
 *      Author: prm
 */

#include "system.h"
#include "altera_avalon_pio_regs.h"

#include <string.h>
#include <stdio.h>

//#include "..\Includes\terasic_includes.h"
//#include "..\Includes\mem_verify.h"

#include "..\Includes\Types.h"
#include "..\Handlers\CurrentCTRL_Handler.h"
#include "..\Handlers\Registers_Handler.h"

#define STATUS_BIT_DONE 	0x01
#define STATUS_BIT_FAIL 	0x02
#define STATUS_BIT_SUCCESS 	0x04
#define STATUS_PLL_LOCKED	0x08

extern void Add_TextToFT600Stack (char*, Uint16);

/* -------------------------------------------------------------------------
 * Process a received interrupt. Interrupts are generated when a transaction
 * completes.
 -------------------------------------------------------------------------- */
int Verify_DDR3_Status(Uint16 JTAG_UART_Flag)
{
int	bPass, DDR3_StatusRegister, stringlength;
char*	DebugString = "NULL";

#ifdef PARAMETER_SYS_TO_EXTERNAL_BUS_BRIDGE_0_BASE

	DDR3_StatusRegister = IORD_ALTERA_AVALON_PIO_DATA(PIO_0_BASE);
	bPass = TRUE;

	if ((DDR3_StatusRegister & STATUS_PLL_LOCKED) != STATUS_PLL_LOCKED){
		stringlength = sprintf(DebugString,"pll is not locked: fail (Status=%xh)\r\n", DDR3_StatusRegister);
	//	Add_TextToFT600Stack(DebugString, stringlength);
		bPass = FALSE;
	}

	if ((DDR3_StatusRegister & STATUS_BIT_DONE) != STATUS_BIT_DONE){
		stringlength = sprintf(DebugString,"local init done: fail (Status=%xh)\r\n", DDR3_StatusRegister);
	//	Add_TextToFT600Stack(DebugString, stringlength);
		bPass = FALSE;
	}

	if (bPass && (((DDR3_StatusRegister & STATUS_BIT_FAIL) == STATUS_BIT_FAIL)
			|| ((DDR3_StatusRegister & STATUS_BIT_SUCCESS) != STATUS_BIT_SUCCESS))){
		stringlength = sprintf(DebugString,"local init: fail\r\n");
	//	Add_TextToFT600Stack(DebugString, stringlength);
		bPass = FALSE;
	}

	if (bPass)
		{
			stringlength = sprintf(DebugString,"DDR3 Status Good: pass (Status=%xh)\r\n", DDR3_StatusRegister);
		}

//	Add_TextToFT600Stack(DebugString, stringlength);

#endif

	return bPass;
}


