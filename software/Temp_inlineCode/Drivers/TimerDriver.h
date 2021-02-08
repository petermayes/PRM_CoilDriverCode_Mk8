/*
 * TimerDriver.h
 *
 *  Created on: 22 Aug 2014
 *      Author: Pete
 */

#ifndef TIMERDRIVER_H_
#define TIMERDRIVER_H_

typedef void (*timer_callback)(void *context);

/* msgdma device structure */
typedef struct timer_dev
{
    /* Name of msgdma in Qsys system */
    const char                           	*name;
    /* Base address of control and status register */
    alt_u32                              	*csr_base;
    /* device IRQ controller ID */
    alt_u32                                 irq_controller_ID;
    /* device IRQ ID */
    alt_u32                                 irq_ID;
    /* Callback routine pointer */
    timer_callback                  		callback;
} __attribute__ ((aligned(0x10))) timer_dev;


void init_timer_interrupt(timer_dev* dev, void* base, alt_u32 irq_controller_id,
        alt_u32 irq, alt_u32 Ticks, void* callback);

extern Uint16 TimeHighPriorityRoutine(int dummy);

#endif /* TIMERDRIVER_H_ */
