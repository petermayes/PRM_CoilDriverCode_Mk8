/*
 * TimerHandler.c
 *
 *  Created on: 7 Jun 2019
 *      Author: prm
 */

#include "system.h"
#include "alt_types.h"
#include "altera_avalon_pio_regs.h"

#include "..\Includes\Types.h"
#include "..\Drivers\TimerDriver.h"
#include "..\Drivers\GPIO_Driver.h"
#include "..\Drivers\FIFO_Driver.h"
#include "..\Handlers\CurrentCTRL_Handler.h"
#include "..\Handlers\Registers_Handler.h"
#include "..\Handlers\msgDMA_Handler.h"
#include "..\Handlers\CurrentCTRL_Handler.h"
//#include "..\Handlers\PatternDataHandler.h"

static void TimerInterruptCallback_HighPriority(int);
static void TimerInterruptCallback_MediumPriority(int);
static void TimerInterruptCallback_LowPriority(int);

alt_u32 *slow_timer_base = (alt_u32*)TIMERSYS_TIMER_0_BASE;
alt_u32 *medium_timer_base  = (alt_u32*)TIMERSYS_TIMER_1_BASE;
alt_u32 *fast_timer_base = (alt_u32*)TIMERSYS_TIMER_2_BASE;

//static const Uint16 TimeData[8] = {1000, 2000, 1500, 2500, 250, 1500, 330, 200};

timer_dev	FastTimerDEV, MediumTimerDEV, SlowTimerDEV;

Uint32 TimerTickCounter = 0;
Uint32 FastTimerTickCounter = 0;

/* -------------------------------------------------------------------------
 * Process a received interrupt. Interrupts are generated when a transaction
 * completes.
 -------------------------------------------------------------------------- */
 void Init_TimerHandler(void)
{
	init_timer_interrupt(&SlowTimerDEV, slow_timer_base,
										TIMERSYS_TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID,
										TIMERSYS_TIMER_0_IRQ, 500000,
										&TimerInterruptCallback_LowPriority); // 2
	init_timer_interrupt(&MediumTimerDEV, medium_timer_base ,
										TIMERSYS_TIMER_1_IRQ_INTERRUPT_CONTROLLER_ID,
										TIMERSYS_TIMER_1_IRQ, 20000,
										&TimerInterruptCallback_MediumPriority); // 3

	init_timer_interrupt(&FastTimerDEV, fast_timer_base,
										TIMERSYS_TIMER_2_IRQ_INTERRUPT_CONTROLLER_ID,
										TIMERSYS_TIMER_2_IRQ, 2000,
										&TimerInterruptCallback_HighPriority); // 3
}

/* -------------------------------------------------------------------------
 * Process a received interrupt. Interrupts are generated when a transaction
 * completes.
 -------------------------------------------------------------------------- */
static void TimerInterruptCallback_LowPriority(int dummy)
{
static Uint16	LED_count, LED_ToggleCount = 0;
static float	Tempfloat;

	Set_TP4();
	Registers.SlowTimerCount.DataField++;

	if (TRUE)
		{
			// Flash LEDS slowly
			LED_count++;
			if (LED_count > 20)
			{
				LED_count = 0;
				LED_ToggleCount++;
			}
		}
	else
		{
			LED_count++;
			LED_ToggleCount++;
		}

	if (LED_ToggleCount & 0x01)
		IOWR_ALTERA_AVALON_PIO_SET_BITS(PHERIPHALS_LED_GPIO_BASE, 0x01f);
	else
		IOWR_ALTERA_AVALON_PIO_CLEAR_BITS(PHERIPHALS_LED_GPIO_BASE, 0x01f);

#ifdef TRUE //CURRCTRL_SYS_CURRCTRL_REGISTER_RAM_BASE


	Tempfloat = (float)(IORD(CURRCTRL_SYS_CURRCTRL_REGISTER_RAM_BASE, 1) >> 12);
	Tempfloat /= *(float*)&Registers.CurrentScalingFactor_bit_mA.DataField;
	Registers.CurrCTRL_MeasuredCurrentmA.DataField = *(Uint32*)&Tempfloat;

	Tempfloat = (float)(IORD(CURRCTRL_SYS_CURRCTRL_REGISTER_RAM_BASE, 2) >> 12);
	Tempfloat *= *(float*)&Registers.VoltageScalingFactor_mV_bit.DataField;
	Tempfloat *= 0.001f;
	Registers.CurrCTRL_AppliedVoltage_V.DataField = *(Uint32*)&Tempfloat;

	Tempfloat = (float)(IORD(CURRCTRL_SYS_CURRCTRL_REGISTER_RAM_BASE, 3) >> 12);
	Tempfloat *= *(float*)&Registers.VoltageScalingFactor_mV_bit.DataField;
	Tempfloat *= 0.001f;
	Registers.CurrCTRL_VoltageDemand_V.DataField = *(Uint32*)&Tempfloat;

	Tempfloat = (float)(IORD(CURRCTRL_SYS_CURRCTRL_REGISTER_RAM_BASE, 4) >> 12);
	Tempfloat *= *(float*)&Registers.CurrentScalingFactor_mA_bit.DataField;
	Registers.CurrCTRL_CurrentDemandAfterRamp_V.DataField = *(Uint32*)&Tempfloat;

	Tempfloat = (float)(IORD(CURRCTRL_SYS_CURRCTRL_REGISTER_RAM_BASE, 5) >> 12);
	Tempfloat *= *(float*)&Registers.CurrentScalingFactor_mA_bit.DataField;
	Registers.CurrCTRL_CurrentDemand_V.DataField = *(Uint32*)&Tempfloat;

	Tempfloat = (float)(IORD(CURRCTRL_SYS_CURRCTRL_REGISTER_RAM_BASE, 6) >> 12);
	Tempfloat *= *(float*)&Registers.CurrentScalingFactor_mA_bit.DataField;
	Registers.CurrCTRL_CurrentLoopErrorTerm.DataField = *(Uint32*)&Tempfloat;

	Tempfloat = (float)(IORD(CURRCTRL_SYS_CURRCTRL_REGISTER_RAM_BASE, 7) >> 11);
	Tempfloat *= *(float*)&Registers.VoltageScalingFactor_mV_bit.DataField;
	Tempfloat *= 0.001f;
	Registers.CurrCTRL_P_Term_V.DataField = *(Uint32*)&Tempfloat;

	Tempfloat = (float)(IORD(CURRCTRL_SYS_CURRCTRL_REGISTER_RAM_BASE, 8) >> 12);
	Tempfloat *= *(float*)&Registers.VoltageScalingFactor_mV_bit.DataField;
	Tempfloat *= 0.001f;
	Registers.CurrCTRL_I_Term_V.DataField = *(Uint32*)&Tempfloat;

	Tempfloat = (float)(IORD(CURRCTRL_SYS_CURRCTRL_REGISTER_RAM_BASE, 9) >> 12);
	Tempfloat *= *(float*)&Registers.VoltageScalingFactor_mV_bit.DataField;
	Tempfloat *= 0.001f;
	Registers.CurrCTRL_OutputDemand.DataField = *(Uint32*)&Tempfloat;

	Tempfloat = (float)(IORD(CURRCTRL_SYS_CURRCTRL_REGISTER_RAM_BASE, 10) >> 12);
	Tempfloat *= *(float*)&Registers.CurrentScalingFactor_mA_bit.DataField;
	Registers.CurrCTRL_I_Trip_Readback.DataField = *(Uint32*)&Tempfloat;

	Registers.CurrCTRL_10.DataField = IORD(CURRCTRL_SYS_CURRCTRL_REGISTER_RAM_BASE, 11);
	Registers.CurrCTRL_11.DataField = IORD(CURRCTRL_SYS_CURRCTRL_REGISTER_RAM_BASE, 12);


#endif

	Clear_TP4();

}


/* -------------------------------------------------------------------------
 * Process a received interrupt. Interrupts are generated when a transaction
 * completes.
 -------------------------------------------------------------------------- */
static void TimerInterruptCallback_MediumPriority(int dummy)
{


	Set_TP4();  // called every 100us
	TimerTickCounter++;

#if 0
	DataInterfaceOperatingModeStatemachine();
#endif

#if 0
	(void)USB_Data_CommsHandler(Decode_USB_Text_String());
#endif

#if 0
	PatternDataHandler();
#endif


	ControlLoopHandler();


	Clear_TP4();
}

/* -------------------------------------------------------------------------
 * Process a received interrupt. Interrupts are generated when a transaction
 * completes.
 -------------------------------------------------------------------------- */
static void TimerInterruptCallback_HighPriority(int dummy)
{
static Uint32	FIFO_FillLevelinWords;
static Uint32	TestWord[3] = {0,0,0};

	Set_TP5();  // called every 100us
	TimerTickCounter++;
	FastTimerTickCounter++;
	Registers.Debug_2.DataField++;


	if (TimerTickCounter & 0x01)
	{

#ifdef CURRCTRL_SYS_MAINDIAGNOSTICFIFO_OUT_CSR_BASE

	FIFO_FillLevelinWords = Read_DDR3_FIFO_FillLevel() >> 2;
	Registers.CurrCTRL_FIFO_Fill_Level.DataField = FIFO_FillLevelinWords;

	if (FIFO_DDR3_Full())
		TransferDataFromFIFOtoDDR3(2048, 0);
	else
		{
			if (FIFO_FillLevelinWords > 1325)
				{
					if (Registers.CurrCTRL_Data0.DataField == 0x55aa55aa)
						TransferDataFromFIFOtoDDR3(1024, 0);
					else
						{
							(void)IORD(CURRCTRL_SYS_MAINDIAGNOSTICFIFO_OUT_BASE, 0);
							TransferDataFromFIFOtoDDR3(1024, 0);
						}
				}
		}

#endif

	}
	else
	{

#ifdef CURRCTRL_SYS_CURRCTRL_DEBUG_RAM_0_BASE

	FIFO_FillLevelinWords = Read_StreamingDebug_FIFO_FillLevel() >> 2;
	Registers.CurrCTRL_FIFO_Fill_Level.DataField = FIFO_FillLevelinWords;

	if ((FIFO_StreamingDebug_Full()) && (TRUE))
		{
			TransferDataFromDebugFIFOtoExtBuffer(512, 0);
			TransferDataFromDebugFIFOtoExtBuffer(512, 0);
		}
	else
		{
			if (FIFO_FillLevelinWords > 515)
				{
					if (Registers.Debug_0.DataField == 0x55aa55aa)
						TransferDataFromDebugFIFOtoExtBuffer(512, 0);
					else
						{
							TestWord[0] = IORD(CURRCTRL_SYS_DEBUGFIFO_OUT_BASE, 0);
							TestWord[1] = IORD(CURRCTRL_SYS_DEBUGFIFO_OUT_BASE, 0);
							TestWord[2] = IORD(CURRCTRL_SYS_DEBUGFIFO_OUT_BASE, 0);
							TransferDataFromDebugFIFOtoExtBuffer(512, 0);
						}
				}

		}

#endif
	}

	DMA_Handler();
	Clear_TP5();
}

/* ----------------------- EOF ---------------------------*/
