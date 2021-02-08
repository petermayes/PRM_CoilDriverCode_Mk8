/*
 * DDR3_Handler.c
 *
 *  Created on: 7 Jun 2019
 *      Author: prm
 */

#include "system.h"
#include "io.h"

#include <string.h>
#include <stdio.h>

#include "..\Includes\Types.h"
//#include "..\Includes\terasic_includes.h"
//#include "..\Includes\mem_verify.h"
#include "..\Handlers\DDR3_Handler.h"

#include "..\Handlers\CurrentCTRL_Handler.h"
#include "..\Handlers\Registers_Handler.h"
#include "..\Drivers\DDR3_Driver.h"
#include "..\Drivers\GPIO_Driver.h"

#if 1

Uint32 CalculateCRC_Value(Uint32 TestLengthInBytes);

extern void Add_TextToFT600Stack (char*, Uint16);

/*  Constant table  */
static const char CRC_TABLE[256] = {
   0x00, 0x07, 0x0E, 0x09, 0x1C, 0x1B, 0x12, 0x15,  // 7
   0x38, 0x3F, 0x36, 0x31, 0x24, 0x23, 0x2A, 0x2D,  // 15
   0x70, 0x77, 0x7E, 0x79, 0x6C, 0x6B, 0x62, 0x65,  // 23
   0x48, 0x4F, 0x46, 0x41, 0x54, 0x53, 0x5A, 0x5D,  // 31
   0xE0, 0xE7, 0xEE, 0xE9, 0xFC, 0xFB, 0xF2, 0xF5,  // 39
   0xD8, 0xDF, 0xD6, 0xD1, 0xC4, 0xC3, 0xCA, 0xCD,  // 47
   0x90, 0x97, 0x9E, 0x99, 0x8C, 0x8B, 0x82, 0x85,  // 55
   0xA8, 0xAF, 0xA6, 0xA1, 0xB4, 0xB3, 0xBA, 0xBD,  // 63
   0xC7, 0xC0, 0xC9, 0xCE, 0xDB, 0xDC, 0xD5, 0xD2,  // 71
   0xFF, 0xF8, 0xF1, 0xF6, 0xE3, 0xE4, 0xED, 0xEA,  // 79
   0xB7, 0xB0, 0xB9, 0xBE, 0xAB, 0xAC, 0xA5, 0xA2,  // 87
   0x8F, 0x88, 0x81, 0x86, 0x93, 0x94, 0x9D, 0x9A,  // 95
   0x27, 0x20, 0x29, 0x2E, 0x3B, 0x3C, 0x35, 0x32,  // 103
   0x1F, 0x18, 0x11, 0x16, 0x03, 0x04, 0x0D, 0x0A,  // 111
   0x57, 0x50, 0x59, 0x5E, 0x4B, 0x4C, 0x45, 0x42,  // 119
   0x6F, 0x68, 0x61, 0x66, 0x73, 0x74, 0x7D, 0x7A,  // 127
   0x89, 0x8E, 0x87, 0x80, 0x95, 0x92, 0x9B, 0x9C,  // 135
   0xB1, 0xB6, 0xBF, 0xB8, 0xAD, 0xAA, 0xA3, 0xA4,  // 143
   0xF9, 0xFE, 0xF7, 0xF0, 0xE5, 0xE2, 0xEB, 0xEC,  // 151
   0xC1, 0xC6, 0xCF, 0xC8, 0xDD, 0xDA, 0xD3, 0xD4,  // 159
   0x69, 0x6E, 0x67, 0x60, 0x75, 0x72, 0x7B, 0x7C,  // 167
   0x51, 0x56, 0x5F, 0x58, 0x4D, 0x4A, 0x43, 0x44,  // 175
   0x19, 0x1E, 0x17, 0x10, 0x05, 0x02, 0x0B, 0x0C,  // 183
   0x21, 0x26, 0x2F, 0x28, 0x3D, 0x3A, 0x33, 0x34,  // 191
   0x4E, 0x49, 0x40, 0x47, 0x52, 0x55, 0x5C, 0x5B,  // 199
   0x76, 0x71, 0x78, 0x7F, 0x6A, 0x6D, 0x64, 0x63,  // 207
   0x3E, 0x39, 0x30, 0x37, 0x22, 0x25, 0x2C, 0x2B,  // 215
   0x06, 0x01, 0x08, 0x0F, 0x1A, 0x1D, 0x14, 0x13,  // 223
   0xAE, 0xA9, 0xA0, 0xA7, 0xB2, 0xB5, 0xBC, 0xBB,  // 231
   0x96, 0x91, 0x98, 0x9F, 0x8A, 0x8D, 0x84, 0x83,  // 239
   0xDE, 0xD9, 0xD0, 0xD7, 0xC2, 0xC5, 0xCC, 0xCB,  // 247
   0xE6, 0xE1, 0xE8, 0xEF, 0xFA, 0xFD, 0xF4, 0xF3   // 255
};

#ifdef MEM_IF_DDR3_EMIF_SPAN

/* -------------------------------------------------------------------------
 * Process a received interrupt. Interrupts are generated when a transaction
 * completes.
 -------------------------------------------------------------------------- */
int Init_DDR3_VerificationRoutine(Uint16 JTAG_UART_Flag)
{
int bPass, i, stringlength;
char*	DebugString = "NULL";

	stringlength = sprintf(DebugString,"DDR3 Test, Size=%dGB (CPU Clock:%dMHz)\r\n", MEM_IF_DDR3_EMIF_SPAN/1024/1024/1024, ALT_CPU_CPU_FREQ/1000/1000);
//	Add_TextToFT600Stack(DebugString, stringlength);

	usleep(100000);
	bPass = Verify_DDR3_Status(JTAG_UART_Flag);

	if ((bPass) && (FALSE))
		{
			for (i = 0; i < 300000; i++)
				{
					IOWR_32DIRECT(MEM_IF_DDR3_EMIF_BASE, i * 4 , i + 5000); //i);
				}

			Registers.DDR3_CRC_Value.DataField = CalculateCRC_Value(32768 * 4);

/*			if (RegisterParameter[REGISTER_DDR3_CRC_VALUE] == 71)
			{
				stringlength = sprintf(DebugString,"DDR3 CRC Test on the first 100kB Passed\r\n");
				Add_TextToFT600Stack(DebugString, stringlength);
			}
			else
			{
				stringlength = sprintf(DebugString,"DDR3 CRC Test on the first 100kB Passed\r\n");
				Add_TextToFT600Stack(DebugString, stringlength);
			}
*/
		}

	return bPass;
}



/* -------------------------------------------------------------------------
 * Process a received interrupt. Interrupts are generated when a transaction
 * completes.
 -------------------------------------------------------------------------- */
Uint32 CalculateCRC_Value(Uint32 TestLengthInBytes)
{
int i;
unsigned char val = 0, memoryRead;
unsigned char* ptr_char;

	for (i = 0; i < TestLengthInBytes; i++)
		{
			ptr_char = (unsigned char*)(MEM_IF_DDR3_EMIF_BASE + i);
			memoryRead = *ptr_char;
			val = CRC_TABLE[val ^ memoryRead];
		}

	return (Uint32)val;
}

#endif


#ifdef PARAMETER_SYS_TO_EXTERNAL_BUS_BRIDGE_0_BASE
/* -------------------------------------------------------------------------
 * Process a received interrupt. Interrupts are generated when a transaction
 * completes.
 -------------------------------------------------------------------------- */
void Copy_CRC_Table_To_External_RAM_Blocks(void)
{
int i;

	for (i = 0; i < 256; i++)
	{

		IOWR_8DIRECT(PARAMETER_SYS_TO_EXTERNAL_BUS_BRIDGE_0_BASE, i, CRC_TABLE[i]);

	}

}

#endif

#if 0

/* -------------------------------------------------------------------------
 * Process a received interrupt. Interrupts are generated when a transaction
 * completes.
 -------------------------------------------------------------------------- */
int Verbose_DDR3_VerificationRoutine(void)
{
int bPass;
static int TestIndex = 0;
alt_u32 InitValue = 0x01;
bool bShowMessage = TRUE;
alt_u32 TimeStart, TimeElapsed;

	bPass = Verify_DDR3_Status(FALSE);

	TestIndex++;
	printf("=====> DDR3 Testing, Iteration: %d\n", TestIndex);
	TimeStart = alt_nticks();

	printf("Testing First Half\r\n");

	/*

	if ((bPass)  || (0))
		bPass = TMEM_Verify(USB_DDR3_RAM_BASE, USB_DDR3_RAM_SPAN >> 3, InitValue,  bShowMessage);

	printf("Testing Second Half\r\n");

	if ((bPass)  || (0))
		bPass = TMEM_Verify(USB_DDR3_RAM_BASE + (USB_DDR3_RAM_SPAN >> 1), USB_DDR3_RAM_SPAN >> 1, InitValue,  bShowMessage);

*/

	TimeElapsed = alt_nticks() - TimeStart;
	printf("DDR3 test:%s, %d seconds\r\n", bPass?"Pass":"NG", (int)(TimeElapsed/alt_ticks_per_second()));


	printf("Press KEY1 for one more Test\r\n");

	return bPass;
}

#endif

#endif


/* ----------------------- */

