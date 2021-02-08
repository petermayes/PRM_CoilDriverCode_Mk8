/*
 * FT600_Driver.c
 *
 *  Created on: 15 Jan 2017
 *      Author: prm
 */

#include "system.h"
#include "alt_types.h"
#include "sys\alt_irq.h"
#include "altera_avalon_pio_regs.h"  // needed for the FT600 GPIO Lines


#include "..\Includes\Types.h"
#include "..\Drivers\GPIO_Driver.h"
#include "..\Handlers\CurrentCTRL_Handler.h"
#include "..\Handlers\msgDMA_Handler.h"
#include "..\Handlers\Registers_Handler.h"

void RegisterDataRX_GPIO_interrupt_irq_routine (void* context);


volatile int USB_Repeat_edge_capture;

#ifdef PARAMETER_SYS_PARAMETER_RX_RAM_BASE

/* -------------------------------------------------------------------------
 * Process a received interrupt. Interrupts are generated when a transaction
 * completes.
 -------------------------------------------------------------------------- */
void Trigger_Parameter_Page_Transmission(void)
{
volatile Uint16	DelayCount;
	// first loop
	IOWR_ALTERA_AVALON_PIO_SET_BITS(PARAMETER_SYS_PARAMETER_GPIO_BASE, 0x01);  //
	for (DelayCount = 0; DelayCount < 5; DelayCount++)
	{
		IOWR_ALTERA_AVALON_PIO_SET_BITS(PARAMETER_SYS_PARAMETER_GPIO_BASE, 0x01);  //
	}
	IOWR_ALTERA_AVALON_PIO_CLEAR_BITS(PARAMETER_SYS_PARAMETER_GPIO_BASE, 0x01);  //
}

#endif

#ifdef PARAMETER_SYS_PARAMETER_RX_RAM_BASE

/*******************************************************************************
 * Check_For_RX_Message                                                        *
 *                                                                             *
 ******************************************************************************/
void RegisterDataRX_GPIO_interrupt_init (void)
{
#ifdef ALT_ENHANCED_INTERRUPT_API_PRESENT

/* Recast the edge_capture pointer to match the alt_irq_register() function
 * prototype. */
void* USB_Repeat_capture_ptr = (void*) &USB_Repeat_edge_capture;


IOWR_ALTERA_AVALON_PIO_IRQ_MASK(PARAMETER_SYS_PARAMETER_GPIO_BASE, 0x0);

/* Reset the edge capture register. */

IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PARAMETER_SYS_PARAMETER_GPIO_BASE, 0x0);

/* Register the interrupt handler. */

    alt_ic_isr_register(PARAMETER_SYS_PARAMETER_GPIO_IRQ_INTERRUPT_CONTROLLER_ID, PARAMETER_SYS_PARAMETER_GPIO_IRQ, RegisterDataRX_GPIO_interrupt_irq_routine, USB_Repeat_capture_ptr, 0x0);

#else
#endif

}



/*******************************************************************************
 * Check_For_RX_Message                                                        *
 *                                                                             *
 ******************************************************************************/
#ifdef ALT_ENHANCED_INTERRUPT_API_PRESENT
void RegisterDataRX_GPIO_interrupt_irq_routine (void* context)
{
/* Cast context to edge_capture's type. It is important that this be
 * declared volatile to avoid unwanted compiler optimization.
 */
volatile int* edge_capture_ptr = (volatile int*) context;
static TransferSTRUC TransferInfo;

	/* Store the value in the Button's edge capture register in *context. */
	*edge_capture_ptr = IORD_ALTERA_AVALON_PIO_EDGE_CAP(PARAMETER_SYS_PARAMETER_GPIO_BASE);
	/* Reset the Button's edge capture register. */
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PARAMETER_SYS_PARAMETER_GPIO_BASE, *edge_capture_ptr);
	(void)IORD_ALTERA_AVALON_PIO_EDGE_CAP(PARAMETER_SYS_PARAMETER_GPIO_BASE);
	/*
	 * Read the PIO to delay ISR exit. This is done to prevent a spurious
	 * interrupt in systems with high processor -> pio latency and fast
	 * interrupts.
	 */

//	DataLength = *(Uint32*)(PARAMETER_SYS_PARAMETER_RX_RAM_BASE + 4096) & 0xff;
	TransferInfo.SourceAddress = (Uint16)((*(Uint32*)(PARAMETER_SYS_PARAMETER_RX_RAM_BASE + 4096) >> 16) & 0xff);
//	CRC_Flag = (*(Uint32*)(PARAMETER_SYS_PARAMETER_RX_RAM_BASE + 4096) >> 24) & 0xff;;

	TransferInfo.CRC_ErrorCount = *(Uint32*)(PARAMETER_SYS_PARAMETER_RX_RAM_BASE + 4100);
	TransferInfo.CRC_Good_Count = *(Uint32*)(PARAMETER_SYS_PARAMETER_RX_RAM_BASE + 4104);


	TransferInfo.DestinationAddress = (Uint16)*(Uint32*)(PARAMETER_SYS_PARAMETER_RX_RAM_BASE + 4);
	TransferInfo.PageCount = (Uint16)*(Uint32*)(PARAMETER_SYS_PARAMETER_RX_RAM_BASE + 8);

	if ((TransferInfo.SourceAddress == 16))
		{
			if ((TransferInfo.DestinationAddress == Registers.Node_Address.DataField) || (FALSE)) // optimiser removes DestinationAddre
				{
					TransferInfo.TargetMemorySlot = (TransferInfo.DestinationAddress << 5) & 0xff;
					TransferInfo.TargetMemorySlot += (TransferInfo.PageCount & 0x1f);

				//	Trigger_Parameter_Page_Transmission();
					if (TransferInfo.PageCount == 0)
						TransferInfo.TransferLength = 64;
					else
						TransferInfo.TransferLength = 255;

					Basic_Parameter_Transfer(&TransferInfo);
				}
		}

	Registers.Parameter_Looop_RX_Error_Count.DataField = TransferInfo.CRC_ErrorCount;
	Registers.Parameter_Looop_RX_Count.DataField = TransferInfo.CRC_Good_Count;

}
#else
void timer_interrupt_irq_routine (void* base, alt_u32 id)
{
}
#endif

#endif


/* -------------------------------- eof ------------------------------ */


