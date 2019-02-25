/*******************************************************************************
*Project Name:
          Casa Aberta 2017 - Quizz Didatico
*Copyright:
          Rodrigo Ferraz Souza
*Test Configuration:
         MCU:              P18F4520
         Dev.Board:        Pr�pria
         Oscillator:       HS, 20.0 MHz
         Ext. Modules:     -
         SW:               mikroC v7.0.1
*NOTES:
       Calculo do valor a ser carregado no registrador de contagem do TIMER0
       VALOR DO REGISTRADOR = MODO - TEMPO/(CICLO DE MAQUINA*PRESCALER)
       VALOR DO REGISTRADOR = 2^16 - 0,5S/(200ns*128)
       VALOR DO REGISTRADOR = 65536-0,5/200.10^-9*128 = 46005 = (B3B5)H
       TMR0L=0XB5;
       TMR0H=0XB3;

                  *********************************
                  *     PIC18F4520                *
                  *    CRISTAL: 20MHz    CM=200ns *
                  *********************************

*******************************************************************************/
int btj1;
int btj2;
int resp;
int ft;               //variavel que diz que o tempo acabou
int rp;               //variavel que diz se a pergunta acabou
int perg;             //variavel que diz em qual pergungta est�
int resposta1(void);
int resposta2(void);
int respostac1(void);
int respostae1(void);
int respostac2(void);
int respostae2(void);

#define LAM1            PORTC.F2                //Sa�da para a lampada amarela do j1
#define LAM2            PORTC.F3                //Sa�da para a lampada amarela do j2
#define A               PORTB.F0                //Botão para a resposta a) de ambos os jogadores
#define B               PORTB.F3                //Botão para a resposta b) de ambos os jogadores
#define C               PORTB.F4                //Botão para a resposta c) de ambos os jogadores
#define D               PORTB.F5                //Botão para a resposta d) de ambos os jogadores
#define E               PORTB.F6                //Botão para a resposta e) de ambos os jogadores
#define BUZINA          PORTD.F0                //Saida para a buzina
#define LVD1            PORTA.F0                //Lampada verde J1
#define LVD2            PORTA.F3                //Lampada verde J2
#define LVM1            PORTA.F2                //Lampada vermelha J1
#define LVM2            PORTA.F1                //Lampada vermelha J2
#define ACABTEMP        PORTC.F6                //Sinal dizendo que o tempo acabou

//rotina de interru��o
void interrupt()
{
  if(INTCON3.INT1IF&&!btj2)  //testa se houve interrup��o no RB1 (INT1)
  {
      btj1=1;
      LAM1=1;
      INTCON3.INT1IF=0;      //reseta a flag de interrup��o do INT1
  }

  if(INTCON3.INT2IF&&!btj2)  //testa se houve interrup��o no RB2 (INT2)
  {
      btj2=1;
      LAM2=1;
      INTCON3.INT2IF=0;      //reseta a flag de interrup��o do INT2
   }
  if(INTCON.TMR0IF)        //verifica se houve estouro de contagem
  {
      PORTC.F4=~PORTC.F4;    //inverte RC4 a cada 0,5s
      TMR0L=0XB5;            //recarrega o byte menos significativo com B5 *
      TMR0H=0XB3;            //recarrega o byte mais significativo com B3 *
      INTCON.TMR0IF=0;       //reseta a flag de estouro do TIMER0
  }
}

respostac1 (void)
{
     LVD1=1;                                   //liga a lampada verde
     PORTC.f0=~PORTC.f0;                       //pulso de clock p placar
     Delay_ms(1000);
     PORTC.f0=~PORTC.f0;                       //pulso de clock p placar
     delay_ms(700);
     LVD1=0;                                   //desliga a lampada vermelha
     rp=1;
     PORTC.f5=1;                               //sinal de reset para o cronometro
}

respostae1(void)
{
     BUZINA=1;                                //buzina
     LVM1=1;                                  //lampada vermelha
     delay_ms(700);
     BUZINA=0;                                //buzina
     LVM1=0;                                  //Lampada vermelha
     rp=1;
     PORTC.f5=1;                              //sinal de reset para o cronometro
}

respostac2(void)
{
      LVD2=1;                                   //lampada verde
      PORTC.f1=~PORTC.f1;                       //pulso de clock p placar
      delay_ms(1000);
      PORTC.f1=~PORTC.f1;
      delay_ms(700);
      LVD2=0;
      rp=1;
      PORTC.f5=1;                               //sinal de reset para o cronometro
}

respostae2(void)
{
      BUZINA=1;                                 //buzina
      LVM2=1;                                   //lampada vermelha
      delay_ms(700);
      BUZINA=0;
      LVM2=0;                                   //lampada vermelha
      rp=1;
      PORTC.f5=1;                               //sinal de reset para o cronometro
}
resposta1 (void)
{
/*******************************************************************************************************
*                                      Rotina p ver a resposta j1                                      *
*******************************************************************************************************/
     while(!rp)
     {
          if(ACABTEMP)                                        //Verifica se o tempo acabou
          {
               BUZINA=1;                                      //Liga a Buzina
               ft=1;                                          //diz que o tempo para responder acabou
               LVM1=1;                                        //liga a lampada vermelha
               delay_ms(700);
               BUZINA=0;                                      //desliga a buzina
               LVM1=0;                                        //Desliga a lampada vermelha
               rp=1;                                          //diz que a pergunta terminou
               PORTC.f5=1;                                    //sinal de reset para o cronometro
          }
          if(A&&!ft&&!rp)
          {
               if(resp==1)                                    //A resposta é "A"?
               {
                    respostac1();
               }
               else
               {
                    respostae1();
               }
          }
          if(B&&!ft&&!rp)
          {
               if(resp==2)                                    //A resposta é "B"?
               {
                    respostac1();
               }
               else
               {
                    respostae1();
               }
          }
          if(C&&!ft&&!rp)
          {
               if(resp==3)                                    //A resposta é "C"?
               {
                     respostac1();
               }
               else
               {
                     respostae1();
               }
          }
          if(D&&!ft&&!rp)
          {
               if(resp==4)                                    //A resposta é "D"?
               {
                   respostac1();
               }
               else
               {
                     respostae1();
               }
          }
          if(E&&!ft&&!rp)
          {
               if(resp==5)                                    //A resposta é "E"?
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
/*******************************************************************************************************
*                                      Rotina p ver a resposta j2                                      *
*******************************************************************************************************/
     while(!rp)                                               //Verifica se o tempo acabou
     {
          if(ACABTEMP)
          {
               BUZINA=1;                                      //buzina
               ft=1;                                          //diz que o tempo para responder acabou
               LVM2=1;                                        //lampada vermelha
               delay_ms(700);
               BUZINA=0;
               LVM2=0;                                        //lampada vermelha
               rp=1;                                          //diz que a pergunta terminou
               PORTC.f5=1;                                    //sinal de reset para o cronometro
          }
          if(A&&!ft&&!rp)
          {
               if(resp==1)                                    //A resposta é "A"?
               {
                    respostac2();
               }
               else
               {
                    respostae2();
                }

          }
          if(B&&!ft&&!rp)
          {
               if(resp==2)                                    //A resposta é "B"?
               {
                    respostac2();
               }
               else
               {
                    respostae2();
               }
          }
          if(C&&!ft&&!rp)
          {
               if(resp==3)                                    //A resposta é "C"?
               {
                    respostac2();
               }
               else
               {
                    respostae2();
               }
          }
          if(D&&!ft&&!rp)
          {
              if(resp==4)                                     //A resposta é "D"?
              {
                   respostac2();
              }
              else
              {
                   respostae2();
              }
          }
          if(E&&!ft&&!rp)
          {
               if(resp==5)                                    //A resposta é "E"?
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

/*************************************************************************************************
*                a variavel "resp" � a que vai definir qual a resposta correta da pergunta :     *
*                                                1 para a)                                       *
*                                                2 para b)                                       *
*                                                3 para c)                                       *
*                                                4 para d)                                       *
*                                                5 para e)                                       *
*************************************************************************************************/


 ADCON1=15;            //desabilita os converssores AD
 //configura��es gerais para interrup��es
 INTCON.GIEH=1;        //habilita as interrup��es (geral)
 INTCON.GIEL=1;        //habilita as interrup��es de baixa prioridade
 RCON.IPEN=1;          //habilita as interrup��es de alta e (ou) baixa prioridade da familia 18F
 //bits responsaveis pela habilita��o da interrup��o externa INT1
 INTCON3.INT1IE=1;     //habilita a interrup��o externa INT1
 INTCON3.INT1IF=0;     //bit de sinaliza��o da interrup��o externa INT1
 INTCON3.INT1IP=1;     //habilita baixa prioridade de interrup��o externa
 TRISB.RB1=1;          //configura o pino RB1 como entrada
 //bit responsavel pelo tipo de disparo
 INTCON2.INTEDG1=0;    //interrup��o externa por borda de descida

 //bits responsaveis pela habilita��o da interrup��o externa INT2
 INTCON3.INT2IE=1;     //habilita a interrup��o externa INT2
 INTCON3.INT2IF=0;     //bit de sinaliza��o da interrup��o externa INT2
 INTCON3.INT2IP=1;     //habilita baixa prioridade de interrup��o externa
 TRISB.RB2=1;          //configura o pino RB2 como entrada
 //bit responsavel pelo tipo de disparo
 INTCON2.INTEDG2=0;    //interrup��o externa por borda de descida
 TRISC=0;
 PORTC=0;
 //configura��o do TIMER0
 T0CON=0B10000110;     //liga o TIMER0, modo 16 bits e prescaler 1:128
 TMR0L=0XB5;           //carrega o byte menos significativo com B5 *
 TMR0H=0XB3;           //carrega o byte mais significativo com B3 *
 INTCON.TMR0IF=0;      //reseta a flag de estouro do TIMER0
 INTCON2.TMR0IP=1;     // Habilita alta prioridade de interrup��o para o Timer0
 INTCON.PEIE=1;        // Liga a chave da interrup��o dos perif�ricos
 INTCON.TMR0IE=1;      // Habilita a Interrup��o do Timer0

 TRISA=0XF0;           //1111 0000
 TRISB=0XFE;           //1111 1110
 TRISC=0X40;           //0100 0000
 TRISD.F0=0;           //0000 0000



    while(1)
    {
         PORTC.F7=0;
         while(!btj1&&!btj2)   //vai ficar preso neste loop at� que um dos bot�es seja precionado
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
              PORTC.F5=1;      //Sinal de reset para o cronometro

              //Pergunta 1
              if(perg==1)
              {
                   resp=1;
                   resposta1();
                   LAM1=0;    //Apaga a lampada amarela
                   PORTC.F5=0;
              }

              //Pergunta 2
              if(perg==2)
              {
                   resp=3;
                   resposta1();
                   LAM1=0;    //Apaga a lampada amarela
                   PORTC.F5=0;
              }

              //Pergunta 3
              if(perg==3)
              {
                   resp=2;
                   resposta1();
                   LAM1=0;    //Apaga a lampada amarela
                   PORTC.F5=0;
              }

              //Pergunta 4
              if(perg==4)
              {
                   resp=2;
                   resposta1();
                   LAM1=0;    //Apaga a lampada amarela
                   PORTC.F5=0;
              }

              //Pergunta 5
              if(perg==5)
              {
                   resp=4;
                   resposta1();
                   LAM1=0;    //Apaga a lampada amarela
                   PORTC.F5=0;
              }

              if(perg<=5)
              {
                   perg++;    //Incremente o numero da prgunta
                   btj1=0;
                   LAM1=0;    //Apaga a lampada amarela
              }
              else
              {
                   perg=1;    //volta para 1 o numero da pergunta
                   btj1=0;
                   LAM1=0;    //apaga a lampada amarela
                   PORTC.F7=1;
                   delay_ms(100);
                   PORTC.F7=0;
              }

         }
         if(btj2)
         {
              PORTC.F7=0;
              PORTC.F5=1;      //Sinal de reset para o cronometro

              //Pergunta 1
              if(perg==1)
              {
                   resp=1;
                   resposta2();
                   LAM2=0;    //Apaga a lampada amarela
                   PORTC.F5=0;
              }

              //Pergunta 2
              if(perg==2)
              {
                   resp=3;
                   resposta2();
                   LAM2=0;    //Apaga a lampada amarela
                   PORTC.F5=0;
              }

              //Pergunta 3
              if(perg==3)
              {
                   resp=2;
                   resposta2();
                   LAM2=0;    //Apaga a lampada amarela
                   PORTC.F5=0;
              }

              //Pergunta 4
              if(perg==4)
              {
                   resp=2;
                   resposta2();
                   LAM2=0;    //Apaga a lampada amarela
                   PORTC.F5=0;
              }

              //Pergunta 5
              if(perg==5)
              {
                   resp=4;
                   resposta2();
                   LAM2=0;    //Apaga a lampada amarela
                   PORTC.F5=0;
              }

              if(perg<=5)
              {
                   perg++;    //Incremente o numero da prgunta
                   btj2=0;
                   LAM2=0;    //Apaga a lampada amarela
              }
              else
              {
                   perg=1;    //volta para 1 o numero da pergunta
                   btj2=0;
                   LAM2=0;    //apaga a lampada amarela
                   PORTC.F7=1;
                   delay_ms(100);
                   PORTC.F7=0;
              }
         }
    }
}