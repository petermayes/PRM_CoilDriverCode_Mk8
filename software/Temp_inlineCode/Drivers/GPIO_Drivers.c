/*
 * GPIO_Driver.c
 *
 *  Created on: 22 Aug 2014
 *      Author: Pete
 */

#include "system.h"
#include "alt_types.h"
#include "sys\alt_irq.h"
#include "altera_avalon_pio_regs.h"

#include "../Includes/Types.h"
#include "GPIO_Driver.h"

#define TP_GPIO_BASE	PHERIPHALS_TP_GPIO_BASE
//#define IO_BRIDGE_BASE	CURRCTRL_SYS_CURRCTRLSYS_BRIDGE_BASE

void GPIO_interrupt_irq_routine (void* base);
void Fast_GPIO_interrupt_irq_routine (void* context);


#if 0

#define IRQ_PIO_BASE  PIO_1_BASE
#define IRQ_PIO_IRQ_INTERRUPT_CONTROLLER_ID  PIO_1_IRQ_INTERRUPT_CONTROLLER_ID
#define IRQ_PIO_IRQ  PIO_1_IRQ

#define IRQ_PIO_FAST_BASE  PIO_0_BASE
#define IRQ_PIO_FAST_IRQ_INTERRUPT_CONTROLLER_ID  PIO_0_IRQ_INTERRUPT_CONTROLLER_ID
#define IRQ_PIO_FAST_IRQ  PIO_0_IRQ

#define PIO_BIT_BASE PIO_1_BASE

#include "..\Copy\ControlLoops.h"


//#define ALT_ENHANCED_INTERRUPT_API_PRESENT				// cannot see it in system.h

volatile int edge_capture;





/*
void SET_GPIO_Interrupt_Mask(Uint16 MaskData)
{
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(IRQ_PIO_BASE, MaskData);
}
*/

void Fast_GPIO_interrupt_init (void)
{
//char* StringToSend = "GPIO Interrupts Started\n";

#ifdef ALT_ENHANCED_INTERRUPT_API_PRESENT

/* Recast the edge_capture pointer to match the alt_irq_register() function
 * prototype. */
void* edge_capture_ptr = (void*) &edge_capture;
/* Enable all 4 button interrupts. */
IOWR_ALTERA_AVALON_PIO_IRQ_MASK(IRQ_PIO_FAST_IRQ, 0x0);
/* Reset the edge capture register. */
IOWR_ALTERA_AVALON_PIO_EDGE_CAP(IRQ_PIO_FAST_IRQ, 0x0);
/* Register the interrupt handler. */
    alt_ic_isr_register(IRQ_PIO_FAST_IRQ_INTERRUPT_CONTROLLER_ID, IRQ_PIO_FAST_IRQ, Fast_GPIO_interrupt_irq_routine, edge_capture_ptr, 0x0);
#else
    alt_irq_register( BUTTON_PIO_IRQ, edge_capture_ptr,
      handle_button_interrupts);
#endif



//	WriteTextPointerToUART_TX_CircularBuffer(&StringToSend[0]);
}

void GPIO_interrupt_init (void)
{
//char* StringToSend = "GPIO Interrupts Started\n";

#ifdef ALT_ENHANCED_INTERRUPT_API_PRESENT

/* Recast the edge_capture pointer to match the alt_irq_register() function
 * prototype. */
void* edge_capture_ptr = (void*) &edge_capture;
/* Enable all 4 button interrupts. */
IOWR_ALTERA_AVALON_PIO_IRQ_MASK(IRQ_PIO_BASE, 0x0);
/* Reset the edge capture register. */
IOWR_ALTERA_AVALON_PIO_EDGE_CAP(IRQ_PIO_BASE, 0x0);
/* Register the interrupt handler. */
    alt_ic_isr_register(IRQ_PIO_IRQ_INTERRUPT_CONTROLLER_ID, IRQ_PIO_IRQ, GPIO_interrupt_irq_routine, edge_capture_ptr, 0x0);
#else
    alt_irq_register( BUTTON_PIO_IRQ, edge_capture_ptr,
      handle_button_interrupts);
#endif

//	WriteTextPointerToUART_TX_CircularBuffer(&StringToSend[0]);
}

#ifdef ALT_ENHANCED_INTERRUPT_API_PRESENT
void GPIO_interrupt_irq_routine (void* context)
{
//static Uint32	WordToWrite;
//static Uint16 	x; //, PreviousValue, CopyOfIndex;
/* Cast context to edge_capture's type. It is important that this be
 * declared volatile to avoid unwanted compiler optimization.
 */
volatile int* edge_capture_ptr = (volatile int*) context;
	/* Store the value in the Button's edge capture register in *context. */
	*edge_capture_ptr = IORD_ALTERA_AVALON_PIO_EDGE_CAP(IRQ_PIO_BASE);
	/* Reset the Button's edge capture register. */
//	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(IRQ_PIO_BASE, 0);
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(IRQ_PIO_BASE, *edge_capture_ptr);

	/*
	 * Read the PIO to delay ISR exit. This is done to prevent a spurious
	 * interrupt in systems with high processor -> pio latency and fast
	 * interrupts.
	 */


	(void)IORD_ALTERA_AVALON_PIO_EDGE_CAP(IRQ_PIO_BASE);




	if (*edge_capture_ptr & 0x01)  // && (TRUE))
		{
	//		Read_Parallel_UART_RX_Data();
	//	FastCurrneLoop();
		}


	if (*edge_capture_ptr & 0x02) // && (TRUE))
	{
		Read_Parallel_UART_RX_Data();
	}

	if (*edge_capture_ptr & 0x04)  // && (TRUE))
	{
		Set_TP3();
		Read_ParallelCAN_Data();
		Clear_TP3();
	}

//	Clear_TP3();


}
#else
void timer_interrupt_irq_routine (void* base, alt_u32 id)
{
  /* Clear TO bit in status register */
  IOWR_ALTERA_AVALON_TIMER_STATUS (base, 0);

  /*Stop timer */
  IOWR_ALTERA_AVALON_TIMER_CONTROL (base, ALTERA_AVALON_TIMER_CONTROL_STOP_MSK);
  interrupt_watch_value = 0xFACEFEED;
}
#endif


#endif


#if 0

#ifdef ALT_ENHANCED_INTERRUPT_API_PRESENT
void Fast_GPIO_interrupt_irq_routine (void* context)
{
//static Uint32	WordToWrite;
//static Uint16 	x; //, PreviousValue, CopyOfIndex;
/* Cast context to edge_capture's type. It is important that this be
 * declared volatile to avoid unwanted compiler optimization.
 */
volatile int* edge_capture_ptr = (volatile int*) context;
	/* Store the value in the Button's edge capture register in *context. */
	*edge_capture_ptr = IORD_ALTERA_AVALON_PIO_EDGE_CAP(IRQ_PIO_FAST_BASE);
	/* Reset the Button's edge capture register. */
//	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(IRQ_PIO_BASE, 0);
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(IRQ_PIO_FAST_BASE, *edge_capture_ptr);

	/*
	 * Read the PIO to delay ISR exit. This is done to prevent a spurious
	 * interrupt in systems with high processor -> pio latency and fast
	 * interrupts.
	 */

//	Set_TP2();
	(void)IORD_ALTERA_AVALON_PIO_EDGE_CAP(IRQ_PIO_FAST_BASE);

//	FastCurrneLoop();
	(void)ALMControlLoops(0);

	Clear_TP2();


}
#else
void timer_interrupt_irq_routine (void* base, alt_u32 id)
{
  /* Clear TO bit in status register */
  IOWR_ALTERA_AVALON_TIMER_STATUS (base, 0);

  /*Stop timer */
  IOWR_ALTERA_AVALON_TIMER_CONTROL (base, ALTERA_AVALON_TIMER_CONTROL_STOP_MSK);
  interrupt_watch_value = 0xFACEFEED;
}
#endif

#endif


#ifdef TP_GPIO_BASE

void Set_TP1(void)
{
	IOWR_ALTERA_AVALON_PIO_SET_BITS(TP_GPIO_BASE, 0x01);
}

void Clear_TP1(void)
{
	IOWR_ALTERA_AVALON_PIO_CLEAR_BITS(TP_GPIO_BASE, 0x01);
}

void Set_TP2(void)
{
	IOWR_ALTERA_AVALON_PIO_SET_BITS(TP_GPIO_BASE, FPGA_TEST_POINT_2);
}

void Clear_TP2(void)
{
	IOWR_ALTERA_AVALON_PIO_CLEAR_BITS(TP_GPIO_BASE, FPGA_TEST_POINT_2);
}

void Set_TP3(void)
{
	IOWR_ALTERA_AVALON_PIO_SET_BITS(TP_GPIO_BASE, FPGA_TEST_POINT_3);
}

void Clear_TP3(void)
{
	IOWR_ALTERA_AVALON_PIO_CLEAR_BITS(TP_GPIO_BASE, FPGA_TEST_POINT_3);
}

void Set_TP4(void)
{
	IOWR_ALTERA_AVALON_PIO_SET_BITS(TP_GPIO_BASE, FPGA_TEST_POINT_4);
}

void Clear_TP4(void)
{
	IOWR_ALTERA_AVALON_PIO_CLEAR_BITS(TP_GPIO_BASE, FPGA_TEST_POINT_4);
}

void Set_TP5(void)
{
	IOWR_ALTERA_AVALON_PIO_SET_BITS(TP_GPIO_BASE, FPGA_TEST_POINT_5);
}

void Clear_TP5(void)
{
	IOWR_ALTERA_AVALON_PIO_CLEAR_BITS(TP_GPIO_BASE, FPGA_TEST_POINT_5);
}

void Set_TP6(void)
{
	IOWR_ALTERA_AVALON_PIO_SET_BITS(TP_GPIO_BASE, FPGA_TEST_POINT_6);
}

void Clear_TP6(void)
{
	IOWR_ALTERA_AVALON_PIO_CLEAR_BITS(TP_GPIO_BASE, FPGA_TEST_POINT_6);
}

void Set_TP7(void)
{
	IOWR_ALTERA_AVALON_PIO_SET_BITS(TP_GPIO_BASE, FPGA_TEST_POINT_7);
}

void Clear_TP7(void)
{
	IOWR_ALTERA_AVALON_PIO_CLEAR_BITS(TP_GPIO_BASE, FPGA_TEST_POINT_7);
}

void Set_TP8(void)
{
	IOWR_ALTERA_AVALON_PIO_SET_BITS(TP_GPIO_BASE, FPGA_TEST_POINT_8);
}

void Clear_TP8(void)
{
	IOWR_ALTERA_AVALON_PIO_CLEAR_BITS(TP_GPIO_BASE, FPGA_TEST_POINT_8);
}

#else

void Set_TP1(void)
{
}

void Clear_TP1(void)
{
}

void Set_TP2(void)
{
}

void Clear_TP2(void)
{
}

void Set_TP3(void)
{
}

void Clear_TP3(void)
{
}

void Set_TP4(void)
{
}

void Clear_TP4(void)
{
}

#endif


#ifdef IO_BRIDGE_BASE

Uint32 Read_ExternalBusRegister(Uint16 Address)
{
	return IORD(IO_BRIDGE_BASE, Address);
}

void Write_ExternalBusRegister(Uint16 Address, Uint32 Data)
{
	IOWR(IO_BRIDGE_BASE, Address, Data);
}

#endif

/* -------------------------- eof --------------------------- */
