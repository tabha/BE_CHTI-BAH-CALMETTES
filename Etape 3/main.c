#include "gassp72.h"




int module(short * tabSig, int k);

extern short TabSig ;

int k = 0;
int tab[64];



void callBack(void){
	
	
	// D�marrage DMA pour 64 points
	Start_DMA1(64);
	Wait_On_End_Of_DMA1();
	Stop_DMA1;
	
	
	
}


int main(void){
	
	// activation de la PLL qui multiplie la fr�quence du quartz par 9
	CLOCK_Configure();
	// PA2 (ADC voie 2) = entr�e analog
	GPIO_Configure(GPIOA, 2, INPUT, ANALOG);
	// PB1 = sortie pour profilage � l'oscillo
	GPIO_Configure(GPIOB, 1, OUTPUT, OUTPUT_PPULL);
	// PB14 = sortie pour LED
	GPIO_Configure(GPIOB, 14, OUTPUT, OUTPUT_PPULL);

	// activation ADC, sampling time 1us
	Init_TimingADC_ActiveADC_ff( ADC1, 72 );
	Single_Channel_ADC( ADC1, 2 );
	// D�clenchement ADC par timer2, periode (72MHz/320kHz)ticks
	Init_Conversion_On_Trig_Timer_ff( ADC1, TIM2_CC2, 225 );
	// Config DMA pour utilisation du buffer dma_buf (a cr��r)
	Init_ADC1_DMA1( 0, dma_buf );

	// Config Timer, p�riode exprim�e en p�riodes horloge CPU (72 MHz)
	Systick_Period_ff( SYSTICK_PER );
	// enregistrement de la fonction de traitement de l'interruption timer
	// ici le 3 est la priorit�, sys_callback est l'adresse de cette fonction, a cr��r en C
	Systick_Prio_IT( 3, sys_callback );
	SysTick_On;
	SysTick_Enable_IT;
	
	
	
	
	
	for (k=0 ; k<64; k++){
			tab[k]=module(&TabSig,k);
	}

	while (1) {}
}
