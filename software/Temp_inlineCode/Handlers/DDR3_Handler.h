/*
 * DDR3_Handler.h
 *
 *  Created on: 7 Jun 2019
 *      Author: prm
 */

#ifndef HANDLERS_DDR3_HANDLER_H_
#define HANDLERS_DDR3_HANDLER_H_

extern int Init_DDR3_VerificationRoutine(Uint16);
extern int Verbose_DDR3_VerificationRoutine(void);
extern void Copy_CRC_Table_To_External_RAM_Blocks(void);
extern Uint32 CalculateCRC_Value(Uint32 TestLengthInBytes);

#define MEMORY_SPAN_IN_BYTES	0x800000				// total memory size 1024MB - assigned space about 128MB
//#define MEMORY_SPAN_IN_BYTES	0x100000				// total memory size 1024MB - assigned space about 16MB
#define MEMORY_MASK				MEMORY_SPAN_IN_BYTES - 1;
#define MEMORY_4K_PAGES			(MEMORY_SPAN_IN_BYTES >> 12)





#endif /* HANDLERS_DDR3_HANDLER_H_ */
