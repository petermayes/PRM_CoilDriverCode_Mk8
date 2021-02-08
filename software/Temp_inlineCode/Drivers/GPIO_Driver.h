/*
 * GPIO_Driver.h
 *
 *  Created on: 22 Aug 2014
 *      Author: Pete
 */

#ifndef GPIO_DRIVER_H_
#define GPIO_DRIVER_H_




#define UART_RX_MESSAGE_0_RD_REGISTER					0
#define UART_RX_MESSAGE_1_RD_REGISTER					1
#define NOT_USED_1										2
#define PROJECT_CODE_READ_RD_REGISTER					3
#define NOT_USED_2										4
#define FPGA_FAULT_FLAGS_RD_REGISTER					10
#define DRIVE_2_FAULT_FLAGS								6

#define STATUS_FLAG_RD_REGISTER							8

#define ENCODER_COUNT_RD_REGISTER						9
#define TEST_REGISTER_SPEED_INCREMENT_RD_REGISTER		14
#define ZERO_SPEED_COUNT_RD_REGISTER					8
#define SHOOT_THROUGH_COUNT_RD_REGISTER					18
#define SPEED_READING_RD_REGISTER						7


#define CAN_RESERVED_4									28
#define CAN_RESERVED_1									29
#define CAN_RESERVED_2									30
#define CAN_RESERVED_3									31
// drive 2 status

// FPGA write registers

#define WATCHDOG_WR_REGISTER							0
#define STATUS_FLAG_WR_REGISTER							1


//extern void UpdateLEDCount(int count);
extern void Set_TP1(void);
extern void Clear_TP1(void);
extern void Set_TP2(void);
extern void Clear_TP2(void);
extern void Set_TP3(void);
extern void Clear_TP3(void);
extern void Set_TP4(void);
extern void Clear_TP4(void);
extern void Set_TP5(void);
extern void Clear_TP5(void);
extern void Set_TP6(void);
extern void Clear_TP6(void);
extern void Set_TP7(void);
extern void Clear_TP7(void);
extern void Set_TP8(void);
extern void Clear_TP8(void);


extern void SET_GPIO_Interrupt_Mask(Uint16 MaskData);
extern void GPIO_interrupt_init (void);
extern void Fast_GPIO_interrupt_init (void);

extern Uint32 Read_ExternalBusRegister(Uint16 Address);
extern void Write_ExternalBusRegister(Uint16 Address, Uint32 Data);

#define		FPGA_TRIGGER_CONTROL_CPU		0x01
#define		FPGA_TEST_POINT_2				0x02
#define		FPGA_TEST_POINT_3				0x04
#define		FPGA_TEST_POINT_4				0x08
#define		FPGA_TEST_POINT_5				0x10
#define		FPGA_TEST_POINT_6				0x20
#define		FPGA_TEST_POINT_7				0x40
#define		FPGA_TEST_POINT_8				0x80

#define 	OP_AMP_ENABLE_BIT				0x10
#define 	GD_B_STANDBY_PIN				0x20
#define		TRIGGER_CAN_TRANSMISSION		0x40


extern Uint16 NewSharedDataFlag,
				NewCANDataFlag,
				NewUARTDataFlag;

#endif /* GPIO_DRIVER_H_ */
