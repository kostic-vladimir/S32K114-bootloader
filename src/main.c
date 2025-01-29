///* Copyright 2023 NXP */
///* License: BSD 3-clause
//   Redistribution and use in source and binary forms, with or without
//   modification, are permitted provided that the following conditions are met:
//    1. Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//    2. Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//    3. Neither the name of the copyright holder nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
//   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//   ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
//   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
//   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
//   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
//   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
//   POSSIBILITY OF SUCH DAMAGE.
//*/
//
///*
// * main implementation: use this 'C' sample to create your own application
// *
// */
//#include "S32K144.h"
//
//#include <stdio.h>
//
//#if defined (__ghs__)
//    #define __INTERRUPT_SVC  __interrupt
//    #define __NO_RETURN _Pragma("ghs nowarning 111")
//#elif defined (__ICCARM__)
//    #define __INTERRUPT_SVC  __svc
//    #define __NO_RETURN _Pragma("diag_suppress=Pe111")
//#elif defined (__GNUC__)
//    #define __INTERRUPT_SVC  __attribute__ ((interrupt ("SVC")))
//    #define __NO_RETURN
//#else
//    #define __INTERRUPT_SVC
//    #define __NO_RETURN
//#endif
//
//int counter, accumulator = 0, limit_value = 1000000;
//
//int main(void) {
//    counter = 0;
//
//    for (;;) {
//        counter++;
//
//        if (counter >= limit_value) {
//            __asm volatile ("svc 0");
//            counter = 0;
//        }
//    }
//    /* to avoid the warning message for GHS and IAR: statement is unreachable*/
//    __NO_RETURN
//    return 0;
//}
//
//__INTERRUPT_SVC void SVC_Handler() {
//    accumulator += counter;
//    printf("counter is 0x%08x, accumulator is 0x%08x\n", counter, accumulator);
//}
/**********************************************************************************************
* External objects
**********************************************************************************************/
#include "S32K144.h" /* include peripheral declarations S32K144 */
#include "S32K144_features.h"
#include "fsl_flash_driver_c90tfs.h"
#include "LPIT.h"
#include "Boot.h"
#include "CSEc_functions.h"
#include "CSEc_macros.h"
#include "FlexCAN.h"
#include "Bootloader_cfg.h"
#include "clocks_and_modes.h"
#include "System.h"
#include "Array.h"
#include "Comm.h"
#include "Secure_Comm.h"
#include "Memory.h"

/**********************************************************************************************
* Global variables
**********************************************************************************************/

/**********************************************************************************************
* Constants and macros
**********************************************************************************************/

/**********************************************************************************************
* Local types
**********************************************************************************************/

/**********************************************************************************************
* Local function prototypes
*********************************************************************************************/

/**********************************************************************************************
* Local variables
**********************************************************************************************/
static uint8_t error_flag = 0;
static uint8_t reset_lpit = 0;
static uint8_t timeout_flag = 0;
static uint8_t transmission_complete = 0;

/**********************************************************************************************
* Local functions
**********************************************************************************************/
void loader_code(void);

/**********************************************************************************************
* Global functions
**********************************************************************************************/

/***********************************************************************************************
*
* @brief    main() - Program entry function
* @param    none
* @return   none
*
************************************************************************************************/
int main(void)
{
	Init_Peripherals();

	Flash_Block_to_Update(); 							/* Locate the flash area with the oldest fw */

	for(;;)
	{
		if(latest_fw_version != 0xFFFFFFFF)
		{
			init_IRQs();    									/*Init interrupts for LPIT*/
			init_LPIT();   										/*Init LPIT timer*/

			/* Wait for transmission to complete or timeout */
			while (0==transmission_complete && 0==timeout_flag)
			{
				loader_code();

				if(1 == reset_lpit)
				{
					Reset_LPIT();		/* Reset Timer  */
					reset_lpit = 0;
				}
			}

			deinit_LPIT();
			deinit_IRQs();

			Restore_Peripherals();		/* Set peripherals and clocks to default state */

			/* Check if the transmission was completed */
			if(transmission_complete == 1)
			{
				Jump_to_New_Fw();		/* Jump to flash location with new fw */
			}
			else if (transmission_complete == 0)
			{
				Jump_to_Old_Fw();		/* Jump to flash location with old firmware */
			}
		}
		else
		{
			/* No valid application present. Stay in bootloader */
			while(1)
			{
				loader_code();

				/* Jump to new firmware when transmission is complete */
				if(transmission_complete == 1)
				{
					Restore_Peripherals();
					Jump_to_New_Fw();
				}
			}
		}
	}

	/* to avoid the warning message for GHS and IAR: statement is unreachable*/
#if defined (__ghs__)
#pragma ghs nowarning 111
#endif
#if defined (__ICCARM__)
#pragma diag_suppress=Pe111
#endif
	return 0;
}


void loader_code(void)
{
	/* Wait for message on MB 4 */
	if (RX_NEW_MSG == Comm_New_Msg_Rx())
	{
		Comm_Rx_Data();		/* Receive the new data */
		if(0==Comm_CRC_Verif())
		{
			reset_lpit = 1;
			error_flag=Update_State_Machine(&transmission_complete);		  /* Enter State Machine to update */
			Comm_Transmit_Ack (error_flag);								      /* Reply message */
		}
	}

	/* Check if the transmission was completed */
	if(transmission_complete == 1)
	{
		/* If transmission completed */
		Update_FW_Headers();	/* Update the new fw header, erase the old fw header*/
	}
}

void LPIT0_Ch0_IRQHandler (void)
{
  LPIT0->MSR|= LPIT_MSR_TIF0_MASK; /* Clear PIT0 flag */
  timeout_flag=1;				   /* Set timeout flag */
}
