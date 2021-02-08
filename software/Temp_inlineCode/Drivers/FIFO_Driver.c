/*
 * FIFO_Driver.c
 *
 *  Created on: 8 Jun 2019
 *      Author: prm
 */

#include "system.h"
#include "alt_types.h"
#include "io.h"
#include "altera_avalon_fifo_regs.h"

#include "..\Includes\Types.h"

#ifdef CURRCTRL_SYS_MAINDIAGNOSTICFIFO_OUT_CSR_BASE

/* -------------------------------------------------------------------------
 * Process a received interrupt. Interrupts are generated when a transaction
 * completes.
 -------------------------------------------------------------------------- */
Uint32 Read_DDR3_FIFO_FillLevel(void)
{
	return IORD(CURRCTRL_SYS_MAINDIAGNOSTICFIFO_OUT_CSR_BASE, ALTERA_AVALON_FIFO_LEVEL_REG);  // this returns fill level
}

/* -------------------------------------------------------------------------
 * Process a received interrupt. Interrupts are generated when a transaction
 * completes.
 -------------------------------------------------------------------------- */
Uint32 FIFO_DDR3_Full(void)
{
	return (IORD(CURRCTRL_SYS_MAINDIAGNOSTICFIFO_OUT_CSR_BASE, ALTERA_AVALON_FIFO_STATUS_REG) & 0x01);  // this returns fill level
}

#endif

#ifdef CURRCTRL_SYS_DEBUGFIFO_OUT_CSR_BASE

/* -------------------------------------------------------------------------
 * Process a received interrupt. Interrupts are generated when a transaction
 * completes.
 -------------------------------------------------------------------------- */
Uint32 FIFO_StreamingDebug_Full(void)
{
	return (IORD(CURRCTRL_SYS_DEBUGFIFO_OUT_CSR_BASE, ALTERA_AVALON_FIFO_STATUS_REG) & 0x01);  // this returns fill level
}

/* -------------------------------------------------------------------------
 * Process a received interrupt. Interrupts are generated when a transaction
 * completes.
 -------------------------------------------------------------------------- */
Uint32 Read_StreamingDebug_FIFO_FillLevel(void)
{
	return IORD(CURRCTRL_SYS_DEBUGFIFO_OUT_CSR_BASE, ALTERA_AVALON_FIFO_LEVEL_REG);  // this returns fill level
}

#endif

/* --------------------------------------- eof -------------------------------------------------------*/
