/*
 * TimerDriver.c
 *
 *  Created on: 22 Aug 2014
 *      Author: Pete
 */

#if (1)

#include "system.h"
#include "alt_types.h"
#include "altera_avalon_timer_regs.h"
#include "sys/alt_irq.h"

#include "../Includes/Types.h"
#include "TimerDriver.h"
#include "GPIO_Driver.h"

#define ALT_ENHANCED_INTERRUPT_API_PRESENT


#ifdef ALT_ENHANCED_INTERRUPT_API_PRESENT
static void handle_timer_interrupts(void*);
#else
static void handle_timer_interrupts(void*, alt_u32);
#endif

/*******************************************************************************
 * init_timer_interrupt()                                                      *
 ******************************************************************************/
void init_timer_interrupt(timer_dev* dev, void* base, alt_u32 irq_controller_id,
        alt_u32 irq, alt_u32 Ticks, void* callback)
{

	dev->csr_base = base;
	dev->callback = callback;

    IOWR_ALTERA_AVALON_TIMER_CONTROL(dev->csr_base, (1<<3) | (1 << 1) |(1 << 0));

    IOWR_ALTERA_AVALON_TIMER_STATUS(dev->csr_base,0);// Clear TO Bit(Reaching 0)
    IOWR_ALTERA_AVALON_TIMER_PERIODL(dev->csr_base,(alt_u16)((Ticks * 1)));//
    IOWR_ALTERA_AVALON_TIMER_PERIODH(dev->csr_base,(alt_u16)( ((Ticks * 1)) >> 16 ));

#ifdef ALT_ENHANCED_INTERRUPT_API_PRESENT
    alt_ic_isr_register(irq_controller_id, irq, handle_timer_interrupts,
    		dev, NULL); //Register Interrupt
#else
    alt_isr_register(TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID, TIMER_0_IRQ, handle_timer_interrupts, ptr, 0x0);
#endif

    IOWR_ALTERA_AVALON_TIMER_CONTROL(dev->csr_base,(1<<2) | (1 << 1) | (1 << 0) );//Start Timer, IRQ enable, Continuous enable*/
}

/*******************************************************************************
 * int main()                                                                  *
 ******************************************************************************/
#ifdef ALT_ENHANCED_INTERRUPT_API_PRESENT
static void handle_timer_interrupts(void* dev)
#else
static void handle_timer_interrupts(void* context, alt_u32 id)
#endif
{
//alt_irq_context cpu_sr;

	  /* clear the interrupt */
	  IOWR_ALTERA_AVALON_TIMER_STATUS (((timer_dev*)dev)->csr_base, 0);
	  /*
	   * Dummy read to ensure IRQ is negated before the ISR returns.
	   * The control register is read because reading the status
	   * register has side-effects per the register map documentation.
	   */
	  IORD_ALTERA_AVALON_TIMER_CONTROL (((timer_dev*)dev)->csr_base);

	  (*((timer_dev*)dev)->callback)(0);  // function call by address
}


#endif
/* ------------------------------- eof ---------------------------------- */

