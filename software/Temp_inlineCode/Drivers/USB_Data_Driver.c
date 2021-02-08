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
#include "..\Handlers\TimerHandler.h"
#include "..\Handlers\msgDMA_Handler.h"
#include "..\Handlers\CurrentCTRL_Handler.h"
#include "..\Handlers\Registers_Handler.h"

void USB_Data_GPIO_interrupt_irq_routine (void* context);

static void USB_RX_Handler(void);

volatile int USB_Repeat_edge_capture;


/*******************************************************************************
 * Check_For_RX_Message                                                        *
 *                                                                             *
 ******************************************************************************/
void USB_Data_GPIO_interrupt_init (void)
{
#ifdef ALT_ENHANCED_INTERRUPT_API_PRESENT

/* Recast the edge_capture pointer to match the alt_irq_register() function
 * prototype. */
void* USB_Repeat_capture_ptr = (void*) &USB_Repeat_edge_capture;


IOWR_ALTERA_AVALON_PIO_IRQ_MASK(USB_DATA_SYS_USB_GPIO_BASE, 0x0);

/* Reset the edge capture register. */

IOWR_ALTERA_AVALON_PIO_EDGE_CAP(USB_DATA_SYS_USB_GPIO_BASE, 0x0);

/* Register the interrupt handler. */

    alt_ic_isr_register(USB_DATA_SYS_USB_GPIO_IRQ_INTERRUPT_CONTROLLER_ID, USB_DATA_SYS_USB_GPIO_IRQ, USB_Data_GPIO_interrupt_irq_routine, USB_Repeat_capture_ptr, 0x0);

#else
#endif

    Registers.USB_RX_MessageCount.DataField = 0;
}



/*******************************************************************************
 * Check_For_RX_Message                                                        *
 *                                                                             *
 ******************************************************************************/
#ifdef ALT_ENHANCED_INTERRUPT_API_PRESENT
void USB_Data_GPIO_interrupt_irq_routine (void* context)
{
/* Cast context to edge_capture's type. It is important that this be
 * declared volatile to avoid unwanted compiler optimization.
 */
volatile int* edge_capture_ptr = (volatile int*) context;
static Uint32	CRC_ErrorCount, CRC_Good_Count;

	/* Store the value in the Button's edge capture register in *context. */
	*edge_capture_ptr = IORD_ALTERA_AVALON_PIO_EDGE_CAP(USB_DATA_SYS_USB_GPIO_BASE);
	/* Reset the Button's edge capture register. */
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(USB_DATA_SYS_USB_GPIO_BASE, *edge_capture_ptr);
	(void)IORD_ALTERA_AVALON_PIO_EDGE_CAP(USB_DATA_SYS_USB_GPIO_BASE);
	/*
	 * Read the PIO to delay ISR exit. This is done to prevent a spurious
	 * interrupt in systems with high processor -> pio latency and fast
	 * interrupts.
	 */

	CRC_ErrorCount = *(Uint32*)(USB_DATA_SYS_USB_RX_RAM_BASE + 4100);
	CRC_Good_Count = *(Uint32*)(USB_DATA_SYS_USB_RX_RAM_BASE + 4104);


	Set_TP1();
	Set_TP2();

	USB_RX_Handler();

	Registers.FT600_RXFn_Logic_Mode.DataField = CRC_ErrorCount;
	Registers.FT600_RXFn_Flag.DataField = CRC_Good_Count;


	Clear_TP2();
	Clear_TP1();
}
#else
void USB_Data_GPIO_interrupt_irq_routine (void* base, alt_u32 id)
{
}
#endif

/*******************************************************************************
 * FT600_TX_Handler                                                            *
 *                                                                             *
 ******************************************************************************/
static void USB_RX_Handler(void)
{
static Uint32 	LastTimerTickCounterValue = 0, CurrentTimerTick;
static Uint16	StreamPage = 0;

	Set_TP1();
	CurrentTimerTick = FastTimerTickCounter;

	if (((CurrentTimerTick - LastTimerTickCounterValue) > 100) || (FALSE))
		{
			StreamPage = 0;
		}
	else
		{
			if (StreamPage > 5000)
				StreamPage = 5000;
			else
				StreamPage++;
		}

	UpdateDMA_WithFT600_RX_CMD(StreamPage);

	Registers.USB_RX_MessageCount.DataField++;
	Registers.USB_RX_StreamPage.DataField = StreamPage;

	LastTimerTickCounterValue = CurrentTimerTick;

	Clear_TP1();

}



/* -------------------------------- eof ------------------------------ */


