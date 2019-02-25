#line 1 "C:/Users/meire/OneDrive - Centro Paula Souza - Etec/Etec/Casa Aberta/2017 - QUIZZ/Projeto/Programas/Programa Final/Mesa2/Casa_Aberta2017.c"
#line 26 "C:/Users/meire/OneDrive - Centro Paula Souza - Etec/Etec/Casa Aberta/2017 - QUIZZ/Projeto/Programas/Programa Final/Mesa2/Casa_Aberta2017.c"
int btj1;
int btj2;
int resp;
int ft;
int rp;
int perg;
int resposta1(void);
int resposta2(void);
int respostac1(void);
int respostae1(void);
int respostac2(void);
int respostae2(void);
#line 54 "C:/Users/meire/OneDrive - Centro Paula Souza - Etec/Etec/Casa Aberta/2017 - QUIZZ/Projeto/Programas/Programa Final/Mesa2/Casa_Aberta2017.c"
void interrupt()
{
 if(INTCON3.INT1IF&&!btj2)
 {
 btj1=1;
  PORTC.F2 =1;
 INTCON3.INT1IF=0;
 }

 if(INTCON3.INT2IF&&!btj2)
 {
 btj2=1;
  PORTC.F3 =1;
 INTCON3.INT2IF=0;
 }
 if(INTCON.TMR0IF)
 {
 PORTC.F4=~PORTC.F4;
 TMR0L=0XB5;
 TMR0H=0XB3;
 INTCON.TMR0IF=0;
 }
}

respostac1 (void)
{
  PORTA.F0 =1;
 PORTC.f0=~PORTC.f0;
 Delay_ms(1000);
 PORTC.f0=~PORTC.f0;
 delay_ms(700);
  PORTA.F0 =0;
 rp=1;
 PORTC.f5=1;
}

respostae1(void)
{
  PORTD.F0 =1;
  PORTA.F2 =1;
 delay_ms(700);
  PORTD.F0 =0;
  PORTA.F2 =0;
 rp=1;
 PORTC.f5=1;
}

respostac2(void)
{
  PORTA.F3 =1;
 PORTC.f1=~PORTC.f1;
 delay_ms(1000);
 PORTC.f1=~PORTC.f1;
 delay_ms(700);
  PORTA.F3 =0;
 rp=1;
 PORTC.f5=1;
}

respostae2(void)
{
  PORTD.F0 =1;
  PORTA.F1 =1;
 delay_ms(700);
  PORTD.F0 =0;
  PORTA.F1 =0;
 rp=1;
 PORTC.f5=1;
}
resposta1 (void)
{
#line 128 "C:/Users/meire/OneDrive - Centro Paula Souza - Etec/Etec/Casa Aberta/2017 - QUIZZ/Projeto/Programas/Programa Final/Mesa2/Casa_Aberta2017.c"
 while(!rp)
 {
 if( PORTC.F6 )
 {
  PORTD.F0 =1;
 ft=1;
  PORTA.F2 =1;
 delay_ms(700);
  PORTD.F0 =0;
  PORTA.F2 =0;
 rp=1;
 PORTC.f5=1;
 }
 if( PORTB.F0 &&!ft&&!rp)
 {
 if(resp==1)
 {
 respostac1();
 }
 else
 {
 respostae1();
 }
 }
 if( PORTB.F3 &&!ft&&!rp)
 {
 if(resp==2)
 {
 respostac1();
 }
 else
 {
 respostae1();
 }
 }
 if( PORTB.F4 &&!ft&&!rp)
 {
 if(resp==3)
 {
 respostac1();
 }
 else
 {
 respostae1();
 }
 }
 if( PORTB.F5 &&!ft&&!rp)
 {
 if(resp==4)
 {
 respostac1();
 }
 else
 {
 respostae1();
 }
 }
 if( PORTB.F6 &&!ft&&!rp)
 {
 if(resp==5)
 {
 respostac1();
 }
 else
 {
 respostae1();
 }
 }
 }
 rp=0;

}

resposta2 (void)
{
#line 206 "C:/Users/meire/OneDrive - Centro Paula Souza - Etec/Etec/Casa Aberta/2017 - QUIZZ/Projeto/Programas/Programa Final/Mesa2/Casa_Aberta2017.c"
 while(!rp)
 {
 if( PORTC.F6 )
 {
  PORTD.F0 =1;
 ft=1;
  PORTA.F1 =1;
 delay_ms(700);
  PORTD.F0 =0;
  PORTA.F1 =0;
 rp=1;
 PORTC.f5=1;
 }
 if( PORTB.F0 &&!ft&&!rp)
 {
 if(resp==1)
 {
 respostac2();
 }
 else
 {
 respostae2();
 }

 }
 if( PORTB.F3 &&!ft&&!rp)
 {
 if(resp==2)
 {
 respostac2();
 }
 else
 {
 respostae2();
 }
 }
 if( PORTB.F4 &&!ft&&!rp)
 {
 if(resp==3)
 {
 respostac2();
 }
 else
 {
 respostae2();
 }
 }
 if( PORTB.F5 &&!ft&&!rp)
 {
 if(resp==4)
 {
 respostac2();
 }
 else
 {
 respostae2();
 }
 }
 if( PORTB.F6 &&!ft&&!rp)
 {
 if(resp==5)
 {
 respostac2();
 }
 else
 {
 respostae2();
 }
 }

 }
 rp=0;
}

void main()
{
 btj1=0;
 btj2=0;
 resp=0;
 ft=0;
 rp=0;
 perg=1;
#line 299 "C:/Users/meire/OneDrive - Centro Paula Souza - Etec/Etec/Casa Aberta/2017 - QUIZZ/Projeto/Programas/Programa Final/Mesa2/Casa_Aberta2017.c"
 ADCON1=15;

 INTCON.GIEH=1;
 INTCON.GIEL=1;
 RCON.IPEN=1;

 INTCON3.INT1IE=1;
 INTCON3.INT1IF=0;
 INTCON3.INT1IP=1;
 TRISB.RB1=1;

 INTCON2.INTEDG1=0;


 INTCON3.INT2IE=1;
 INTCON3.INT2IF=0;
 INTCON3.INT2IP=1;
 TRISB.RB2=1;

 INTCON2.INTEDG2=0;
 TRISC=0;
 PORTC=0;

 T0CON=0B10000110;
 TMR0L=0XB5;
 TMR0H=0XB3;
 INTCON.TMR0IF=0;
 INTCON2.TMR0IP=1;
 INTCON.PEIE=1;
 INTCON.TMR0IE=1;

 TRISA=0XF0;
 TRISB=0XFE;
 TRISC=0X40;
 TRISD.F0=0;



 while(1)
 {
 PORTC.F7=0;
 while(!btj1&&!btj2)
 {
 if(perg==1)
 {
 PORTC.F7=1;
 delay_ms(1000);
 PORTC.F7=0;
 }
 }
 if(btj1)
 {
 PORTC.F7=0;
 PORTC.F5=1;


 if(perg==1)
 {
 resp=1;
 resposta1();
  PORTC.F2 =0;
 PORTC.F5=0;
 }


 if(perg==2)
 {
 resp=3;
 resposta1();
  PORTC.F2 =0;
 PORTC.F5=0;
 }


 if(perg==3)
 {
 resp=2;
 resposta1();
  PORTC.F2 =0;
 PORTC.F5=0;
 }


 if(perg==4)
 {
 resp=2;
 resposta1();
  PORTC.F2 =0;
 PORTC.F5=0;
 }


 if(perg==5)
 {
 resp=4;
 resposta1();
  PORTC.F2 =0;
 PORTC.F5=0;
 }

 if(perg<=5)
 {
 perg++;
 btj1=0;
  PORTC.F2 =0;
 }
 else
 {
 perg=1;
 btj1=0;
  PORTC.F2 =0;
 PORTC.F7=1;
 delay_ms(100);
 PORTC.F7=0;
 }

 }
 if(btj2)
 {
 PORTC.F7=0;
 PORTC.F5=1;


 if(perg==1)
 {
 resp=1;
 resposta2();
  PORTC.F3 =0;
 PORTC.F5=0;
 }


 if(perg==2)
 {
 resp=3;
 resposta2();
  PORTC.F3 =0;
 PORTC.F5=0;
 }


 if(perg==3)
 {
 resp=2;
 resposta2();
  PORTC.F3 =0;
 PORTC.F5=0;
 }


 if(perg==4)
 {
 resp=2;
 resposta2();
  PORTC.F3 =0;
 PORTC.F5=0;
 }


 if(perg==5)
 {
 resp=4;
 resposta2();
  PORTC.F3 =0;
 PORTC.F5=0;
 }

 if(perg<=5)
 {
 perg++;
 btj2=0;
  PORTC.F3 =0;
 }
 else
 {
 perg=1;
 btj2=0;
  PORTC.F3 =0;
 PORTC.F7=1;
 delay_ms(100);
 PORTC.F7=0;
 }
 }
 }
}
