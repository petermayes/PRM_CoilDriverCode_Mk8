/*
 * msgDMA_Handler.h
 *
 *  Created on: 8 Jun 2019
 *      Author: prm
 */

#ifndef HANDLERS_MSGDMA_HANDLER_H_
#define HANDLERS_MSGDMA_HANDLER_H_


#define NUMBER_OF_REGISTERS			(1024 - FIRST_TEXT_AREA_BYTES - FIRST_TEXT_AREA_BYTES) //32)
#define FIRST_TEXT_AREA_BYTES		16 //

#define NULL_ACTION							0
#define PARAMETER_REQUEST					1
#define USB_RX_ACTION						2
#define FIFO_WRITE							3
#define FIFO_READ							4
#define FIFO_STREAMING_DEBUG_READ_0			5
#define FIFO_STREAMING_DEBUG_READ_1			6
#define FIFO_STREAMING_DEBUG_READ_2			7
#define FIFO_STREAMING_DEBUG_READ_3			8

#define READ_FROM_FIXED_ADDRESS				0
#define WRITE_TO_FIXED_ADDRESS				0
#define READ_FROM_INCREMENTING_ADDRESS		1
#define WRITE_TO_INCREMENTING_ADDRESS		1

typedef struct DMA_Queue
{
	void*			DestinationAddress;
	void*			SourceAddress;
    int16	        BytesToTransfer;
    Uint16			TargetMemorySlot;
    Uint16			FIFO_WriteFlag;
    Uint16			FIFO_ReadFlag;
    Uint16			InterruptFlag;
    int16			TransferLength;
} DMA_Queue;

typedef struct TransferSTRUC
{
	Uint16			SourceAddress;
	Uint16	        TransferFlag;
    Uint16			TransferLength;
    Uint16			PageCount;
    Uint16			TargetMemorySlot;
    Uint16			DestinationAddress;
    Uint32			CRC_ErrorCount;
    Uint32			CRC_Good_Count;
} TransferSTRUC;

extern int Init_msgDMA_Module(void);
extern void DMA_Handler(void);

extern int Trigger_FIFOmsgDMA_AsynchCall_2 (DMA_Queue*);

extern void Basic_Parameter_Transfer(TransferSTRUC*);
extern void UpdateDMA_WithFT600_RX_CMD(Uint16 PageCount);
extern void TransferDataFromDDR3toFIFO(Uint16 BytesToTransfer, Uint32 WordReadIndex);
extern void TransferDataFromFIFOtoDDR3(Uint16 WordsToTransfer, Uint32 WordReadIndex);
extern void TransferDataFromDebugFIFOtoExtBuffer(Uint16, Uint32);

#endif /* HANDLERS_MSGDMA_HANDLER_H_ */
