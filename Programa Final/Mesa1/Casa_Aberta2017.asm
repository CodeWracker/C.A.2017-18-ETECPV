
_interrupt:

	BTFSS       INTCON3+0, 0 
	GOTO        L_interrupt2
	MOVF        _btj2+0, 0 
	IORWF       _btj2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt2
L__interrupt96:
	MOVLW       1
	MOVWF       _btj1+0 
	MOVLW       0
	MOVWF       _btj1+1 
	BSF         PORTC+0, 2 
	BCF         INTCON3+0, 0 
L_interrupt2:
	BTFSS       INTCON3+0, 1 
	GOTO        L_interrupt5
	MOVF        _btj2+0, 0 
	IORWF       _btj2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt5
L__interrupt95:
	MOVLW       1
	MOVWF       _btj2+0 
	MOVLW       0
	MOVWF       _btj2+1 
	BSF         PORTC+0, 3 
	BCF         INTCON3+0, 1 
L_interrupt5:
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt6
	BTG         PORTC+0, 4 
	MOVLW       181
	MOVWF       TMR0L+0 
	MOVLW       179
	MOVWF       TMR0H+0 
	BCF         INTCON+0, 2 
L_interrupt6:
L_end_interrupt:
L__interrupt109:
	RETFIE      1
; end of _interrupt

_respostac1:

	BSF         PORTA+0, 0 
	BTG         PORTC+0, 0 
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_respostac17:
	DECFSZ      R13, 1, 1
	BRA         L_respostac17
	DECFSZ      R12, 1, 1
	BRA         L_respostac17
	DECFSZ      R11, 1, 1
	BRA         L_respostac17
	NOP
	NOP
	BTG         PORTC+0, 0 
	MOVLW       18
	MOVWF       R11, 0
	MOVLW       194
	MOVWF       R12, 0
	MOVLW       102
	MOVWF       R13, 0
L_respostac18:
	DECFSZ      R13, 1, 1
	BRA         L_respostac18
	DECFSZ      R12, 1, 1
	BRA         L_respostac18
	DECFSZ      R11, 1, 1
	BRA         L_respostac18
	NOP
	BCF         PORTA+0, 0 
	MOVLW       1
	MOVWF       _rp+0 
	MOVLW       0
	MOVWF       _rp+1 
	BSF         PORTC+0, 5 
L_end_respostac1:
	RETURN      0
; end of _respostac1

_respostae1:

	BSF         PORTD+0, 0 
	BSF         PORTA+0, 2 
	MOVLW       18
	MOVWF       R11, 0
	MOVLW       194
	MOVWF       R12, 0
	MOVLW       102
	MOVWF       R13, 0
L_respostae19:
	DECFSZ      R13, 1, 1
	BRA         L_respostae19
	DECFSZ      R12, 1, 1
	BRA         L_respostae19
	DECFSZ      R11, 1, 1
	BRA         L_respostae19
	NOP
	BCF         PORTD+0, 0 
	BCF         PORTA+0, 2 
	MOVLW       1
	MOVWF       _rp+0 
	MOVLW       0
	MOVWF       _rp+1 
	BSF         PORTC+0, 5 
L_end_respostae1:
	RETURN      0
; end of _respostae1

_respostac2:

	BSF         PORTA+0, 3 
	BTG         PORTC+0, 1 
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_respostac210:
	DECFSZ      R13, 1, 1
	BRA         L_respostac210
	DECFSZ      R12, 1, 1
	BRA         L_respostac210
	DECFSZ      R11, 1, 1
	BRA         L_respostac210
	NOP
	NOP
	BTG         PORTC+0, 1 
	MOVLW       18
	MOVWF       R11, 0
	MOVLW       194
	MOVWF       R12, 0
	MOVLW       102
	MOVWF       R13, 0
L_respostac211:
	DECFSZ      R13, 1, 1
	BRA         L_respostac211
	DECFSZ      R12, 1, 1
	BRA         L_respostac211
	DECFSZ      R11, 1, 1
	BRA         L_respostac211
	NOP
	BCF         PORTA+0, 3 
	MOVLW       1
	MOVWF       _rp+0 
	MOVLW       0
	MOVWF       _rp+1 
	BSF         PORTC+0, 5 
L_end_respostac2:
	RETURN      0
; end of _respostac2

_respostae2:

	BSF         PORTD+0, 0 
	BSF         PORTA+0, 1 
	MOVLW       18
	MOVWF       R11, 0
	MOVLW       194
	MOVWF       R12, 0
	MOVLW       102
	MOVWF       R13, 0
L_respostae212:
	DECFSZ      R13, 1, 1
	BRA         L_respostae212
	DECFSZ      R12, 1, 1
	BRA         L_respostae212
	DECFSZ      R11, 1, 1
	BRA         L_respostae212
	NOP
	BCF         PORTD+0, 0 
	BCF         PORTA+0, 1 
	MOVLW       1
	MOVWF       _rp+0 
	MOVLW       0
	MOVWF       _rp+1 
	BSF         PORTC+0, 5 
L_end_respostae2:
	RETURN      0
; end of _respostae2

_resposta1:

L_resposta113:
	MOVF        _rp+0, 0 
	IORWF       _rp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta114
	BTFSS       PORTC+0, 6 
	GOTO        L_resposta115
	BSF         PORTD+0, 0 
	MOVLW       1
	MOVWF       _ft+0 
	MOVLW       0
	MOVWF       _ft+1 
	BSF         PORTA+0, 2 
	MOVLW       18
	MOVWF       R11, 0
	MOVLW       194
	MOVWF       R12, 0
	MOVLW       102
	MOVWF       R13, 0
L_resposta116:
	DECFSZ      R13, 1, 1
	BRA         L_resposta116
	DECFSZ      R12, 1, 1
	BRA         L_resposta116
	DECFSZ      R11, 1, 1
	BRA         L_resposta116
	NOP
	BCF         PORTD+0, 0 
	BCF         PORTA+0, 2 
	MOVLW       1
	MOVWF       _rp+0 
	MOVLW       0
	MOVWF       _rp+1 
	BSF         PORTC+0, 5 
L_resposta115:
	BTFSS       PORTB+0, 0 
	GOTO        L_resposta119
	MOVF        _ft+0, 0 
	IORWF       _ft+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta119
	MOVF        _rp+0, 0 
	IORWF       _rp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta119
L__resposta1101:
	MOVLW       0
	XORWF       _resp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__resposta1115
	MOVLW       1
	XORWF       _resp+0, 0 
L__resposta1115:
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta120
	CALL        _respostac1+0, 0
	GOTO        L_resposta121
L_resposta120:
	CALL        _respostae1+0, 0
L_resposta121:
L_resposta119:
	BTFSS       PORTB+0, 3 
	GOTO        L_resposta124
	MOVF        _ft+0, 0 
	IORWF       _ft+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta124
	MOVF        _rp+0, 0 
	IORWF       _rp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta124
L__resposta1100:
	MOVLW       0
	XORWF       _resp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__resposta1116
	MOVLW       2
	XORWF       _resp+0, 0 
L__resposta1116:
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta125
	CALL        _respostac1+0, 0
	GOTO        L_resposta126
L_resposta125:
	CALL        _respostae1+0, 0
L_resposta126:
L_resposta124:
	BTFSS       PORTB+0, 4 
	GOTO        L_resposta129
	MOVF        _ft+0, 0 
	IORWF       _ft+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta129
	MOVF        _rp+0, 0 
	IORWF       _rp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta129
L__resposta199:
	MOVLW       0
	XORWF       _resp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__resposta1117
	MOVLW       3
	XORWF       _resp+0, 0 
L__resposta1117:
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta130
	CALL        _respostac1+0, 0
	GOTO        L_resposta131
L_resposta130:
	CALL        _respostae1+0, 0
L_resposta131:
L_resposta129:
	BTFSS       PORTB+0, 5 
	GOTO        L_resposta134
	MOVF        _ft+0, 0 
	IORWF       _ft+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta134
	MOVF        _rp+0, 0 
	IORWF       _rp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta134
L__resposta198:
	MOVLW       0
	XORWF       _resp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__resposta1118
	MOVLW       4
	XORWF       _resp+0, 0 
L__resposta1118:
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta135
	CALL        _respostac1+0, 0
	GOTO        L_resposta136
L_resposta135:
	CALL        _respostae1+0, 0
L_resposta136:
L_resposta134:
	BTFSS       PORTB+0, 6 
	GOTO        L_resposta139
	MOVF        _ft+0, 0 
	IORWF       _ft+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta139
	MOVF        _rp+0, 0 
	IORWF       _rp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta139
L__resposta197:
	MOVLW       0
	XORWF       _resp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__resposta1119
	MOVLW       5
	XORWF       _resp+0, 0 
L__resposta1119:
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta140
	CALL        _respostac1+0, 0
	GOTO        L_resposta141
L_resposta140:
	CALL        _respostae1+0, 0
L_resposta141:
L_resposta139:
	GOTO        L_resposta113
L_resposta114:
	CLRF        _rp+0 
	CLRF        _rp+1 
L_end_resposta1:
	RETURN      0
; end of _resposta1

_resposta2:

L_resposta242:
	MOVF        _rp+0, 0 
	IORWF       _rp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta243
	BTFSS       PORTC+0, 6 
	GOTO        L_resposta244
	BSF         PORTD+0, 0 
	MOVLW       1
	MOVWF       _ft+0 
	MOVLW       0
	MOVWF       _ft+1 
	BSF         PORTA+0, 1 
	MOVLW       18
	MOVWF       R11, 0
	MOVLW       194
	MOVWF       R12, 0
	MOVLW       102
	MOVWF       R13, 0
L_resposta245:
	DECFSZ      R13, 1, 1
	BRA         L_resposta245
	DECFSZ      R12, 1, 1
	BRA         L_resposta245
	DECFSZ      R11, 1, 1
	BRA         L_resposta245
	NOP
	BCF         PORTD+0, 0 
	BCF         PORTA+0, 1 
	MOVLW       1
	MOVWF       _rp+0 
	MOVLW       0
	MOVWF       _rp+1 
	BSF         PORTC+0, 5 
L_resposta244:
	BTFSS       PORTB+0, 0 
	GOTO        L_resposta248
	MOVF        _ft+0, 0 
	IORWF       _ft+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta248
	MOVF        _rp+0, 0 
	IORWF       _rp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta248
L__resposta2106:
	MOVLW       0
	XORWF       _resp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__resposta2121
	MOVLW       1
	XORWF       _resp+0, 0 
L__resposta2121:
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta249
	CALL        _respostac2+0, 0
	GOTO        L_resposta250
L_resposta249:
	CALL        _respostae2+0, 0
L_resposta250:
L_resposta248:
	BTFSS       PORTB+0, 3 
	GOTO        L_resposta253
	MOVF        _ft+0, 0 
	IORWF       _ft+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta253
	MOVF        _rp+0, 0 
	IORWF       _rp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta253
L__resposta2105:
	MOVLW       0
	XORWF       _resp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__resposta2122
	MOVLW       2
	XORWF       _resp+0, 0 
L__resposta2122:
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta254
	CALL        _respostac2+0, 0
	GOTO        L_resposta255
L_resposta254:
	CALL        _respostae2+0, 0
L_resposta255:
L_resposta253:
	BTFSS       PORTB+0, 4 
	GOTO        L_resposta258
	MOVF        _ft+0, 0 
	IORWF       _ft+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta258
	MOVF        _rp+0, 0 
	IORWF       _rp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta258
L__resposta2104:
	MOVLW       0
	XORWF       _resp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__resposta2123
	MOVLW       3
	XORWF       _resp+0, 0 
L__resposta2123:
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta259
	CALL        _respostac2+0, 0
	GOTO        L_resposta260
L_resposta259:
	CALL        _respostae2+0, 0
L_resposta260:
L_resposta258:
	BTFSS       PORTB+0, 5 
	GOTO        L_resposta263
	MOVF        _ft+0, 0 
	IORWF       _ft+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta263
	MOVF        _rp+0, 0 
	IORWF       _rp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta263
L__resposta2103:
	MOVLW       0
	XORWF       _resp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__resposta2124
	MOVLW       4
	XORWF       _resp+0, 0 
L__resposta2124:
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta264
	CALL        _respostac2+0, 0
	GOTO        L_resposta265
L_resposta264:
	CALL        _respostae2+0, 0
L_resposta265:
L_resposta263:
	BTFSS       PORTB+0, 6 
	GOTO        L_resposta268
	MOVF        _ft+0, 0 
	IORWF       _ft+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta268
	MOVF        _rp+0, 0 
	IORWF       _rp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta268
L__resposta2102:
	MOVLW       0
	XORWF       _resp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__resposta2125
	MOVLW       5
	XORWF       _resp+0, 0 
L__resposta2125:
	BTFSS       STATUS+0, 2 
	GOTO        L_resposta269
	CALL        _respostac2+0, 0
	GOTO        L_resposta270
L_resposta269:
	CALL        _respostae2+0, 0
L_resposta270:
L_resposta268:
	GOTO        L_resposta242
L_resposta243:
	CLRF        _rp+0 
	CLRF        _rp+1 
L_end_resposta2:
	RETURN      0
; end of _resposta2

_main:

	CLRF        _btj1+0 
	CLRF        _btj1+1 
	CLRF        _btj2+0 
	CLRF        _btj2+1 
	CLRF        _resp+0 
	CLRF        _resp+1 
	CLRF        _ft+0 
	CLRF        _ft+1 
	CLRF        _rp+0 
	CLRF        _rp+1 
	MOVLW       1
	MOVWF       _perg+0 
	MOVLW       0
	MOVWF       _perg+1 
	MOVLW       15
	MOVWF       ADCON1+0 
	BSF         INTCON+0, 7 
	BSF         INTCON+0, 6 
	BSF         RCON+0, 7 
	BSF         INTCON3+0, 3 
	BCF         INTCON3+0, 0 
	BSF         INTCON3+0, 6 
	BSF         TRISB+0, 1 
	BCF         INTCON2+0, 5 
	BSF         INTCON3+0, 4 
	BCF         INTCON3+0, 1 
	BSF         INTCON3+0, 7 
	BSF         TRISB+0, 2 
	BCF         INTCON2+0, 4 
	CLRF        TRISC+0 
	CLRF        PORTC+0 
	MOVLW       134
	MOVWF       T0CON+0 
	MOVLW       181
	MOVWF       TMR0L+0 
	MOVLW       179
	MOVWF       TMR0H+0 
	BCF         INTCON+0, 2 
	BSF         INTCON2+0, 2 
	BSF         INTCON+0, 6 
	BSF         INTCON+0, 5 
	MOVLW       240
	MOVWF       TRISA+0 
	MOVLW       254
	MOVWF       TRISB+0 
	MOVLW       64
	MOVWF       TRISC+0 
	BCF         TRISD+0, 0 
L_main71:
L_main73:
	MOVF        _btj1+0, 0 
	IORWF       _btj1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main74
	MOVF        _btj2+0, 0 
	IORWF       _btj2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main74
L__main107:
	MOVLW       0
	XORWF       _perg+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main127
	MOVLW       1
	XORWF       _perg+0, 0 
L__main127:
	BTFSS       STATUS+0, 2 
	GOTO        L_main77
	BSF         PORTC+0, 7 
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main78:
	DECFSZ      R13, 1, 1
	BRA         L_main78
	DECFSZ      R12, 1, 1
	BRA         L_main78
	DECFSZ      R11, 1, 1
	BRA         L_main78
	NOP
	BCF         PORTC+0, 7 
L_main77:
	GOTO        L_main73
L_main74:
	MOVF        _btj1+0, 0 
	IORWF       _btj1+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main79
	BCF         PORTC+0, 7 
	BSF         PORTC+0, 5 
	MOVLW       0
	XORWF       _perg+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main128
	MOVLW       1
	XORWF       _perg+0, 0 
L__main128:
	BTFSS       STATUS+0, 2 
	GOTO        L_main80
	MOVLW       4
	MOVWF       _resp+0 
	MOVLW       0
	MOVWF       _resp+1 
	CALL        _resposta1+0, 0
	BCF         PORTC+0, 2 
	BCF         PORTC+0, 5 
L_main80:
	MOVLW       0
	XORWF       _perg+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main129
	MOVLW       2
	XORWF       _perg+0, 0 
L__main129:
	BTFSS       STATUS+0, 2 
	GOTO        L_main81
	MOVLW       1
	MOVWF       _resp+0 
	MOVLW       0
	MOVWF       _resp+1 
	CALL        _resposta1+0, 0
	BCF         PORTC+0, 2 
	BCF         PORTC+0, 5 
L_main81:
	MOVLW       0
	XORWF       _perg+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main130
	MOVLW       3
	XORWF       _perg+0, 0 
L__main130:
	BTFSS       STATUS+0, 2 
	GOTO        L_main82
	MOVLW       2
	MOVWF       _resp+0 
	MOVLW       0
	MOVWF       _resp+1 
	CALL        _resposta1+0, 0
	BCF         PORTC+0, 2 
	BCF         PORTC+0, 5 
L_main82:
	MOVLW       0
	XORWF       _perg+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main131
	MOVLW       4
	XORWF       _perg+0, 0 
L__main131:
	BTFSS       STATUS+0, 2 
	GOTO        L_main83
	MOVLW       1
	MOVWF       _resp+0 
	MOVLW       0
	MOVWF       _resp+1 
	CALL        _resposta1+0, 0
	BCF         PORTC+0, 2 
	BCF         PORTC+0, 5 
L_main83:
	MOVLW       0
	XORWF       _perg+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main132
	MOVLW       5
	XORWF       _perg+0, 0 
L__main132:
	BTFSS       STATUS+0, 2 
	GOTO        L_main84
	MOVLW       4
	MOVWF       _resp+0 
	MOVLW       0
	MOVWF       _resp+1 
	CALL        _resposta1+0, 0
	BCF         PORTC+0, 2 
	BCF         PORTC+0, 5 
L_main84:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _perg+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main133
	MOVF        _perg+0, 0 
	SUBLW       5
L__main133:
	BTFSS       STATUS+0, 0 
	GOTO        L_main85
	INFSNZ      _perg+0, 1 
	INCF        _perg+1, 1 
	CLRF        _btj1+0 
	CLRF        _btj1+1 
	BCF         PORTC+0, 2 
	GOTO        L_main86
L_main85:
	MOVLW       1
	MOVWF       _perg+0 
	MOVLW       0
	MOVWF       _perg+1 
	CLRF        _btj1+0 
	CLRF        _btj1+1 
	BCF         PORTC+0, 2 
L_main86:
L_main79:
	MOVF        _btj2+0, 0 
	IORWF       _btj2+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main87
	BCF         PORTC+0, 7 
	BSF         PORTC+0, 5 
	MOVLW       0
	XORWF       _perg+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main134
	MOVLW       1
	XORWF       _perg+0, 0 
L__main134:
	BTFSS       STATUS+0, 2 
	GOTO        L_main88
	MOVLW       4
	MOVWF       _resp+0 
	MOVLW       0
	MOVWF       _resp+1 
	CALL        _resposta2+0, 0
	BCF         PORTC+0, 3 
	BCF         PORTC+0, 5 
L_main88:
	MOVLW       0
	XORWF       _perg+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main135
	MOVLW       2
	XORWF       _perg+0, 0 
L__main135:
	BTFSS       STATUS+0, 2 
	GOTO        L_main89
	MOVLW       1
	MOVWF       _resp+0 
	MOVLW       0
	MOVWF       _resp+1 
	CALL        _resposta2+0, 0
	BCF         PORTC+0, 3 
	BCF         PORTC+0, 5 
L_main89:
	MOVLW       0
	XORWF       _perg+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main136
	MOVLW       3
	XORWF       _perg+0, 0 
L__main136:
	BTFSS       STATUS+0, 2 
	GOTO        L_main90
	MOVLW       2
	MOVWF       _resp+0 
	MOVLW       0
	MOVWF       _resp+1 
	CALL        _resposta2+0, 0
	BCF         PORTC+0, 3 
	BCF         PORTC+0, 5 
L_main90:
	MOVLW       0
	XORWF       _perg+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main137
	MOVLW       4
	XORWF       _perg+0, 0 
L__main137:
	BTFSS       STATUS+0, 2 
	GOTO        L_main91
	MOVLW       1
	MOVWF       _resp+0 
	MOVLW       0
	MOVWF       _resp+1 
	CALL        _resposta2+0, 0
	BCF         PORTC+0, 3 
	BCF         PORTC+0, 5 
L_main91:
	MOVLW       0
	XORWF       _perg+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main138
	MOVLW       5
	XORWF       _perg+0, 0 
L__main138:
	BTFSS       STATUS+0, 2 
	GOTO        L_main92
	MOVLW       4
	MOVWF       _resp+0 
	MOVLW       0
	MOVWF       _resp+1 
	CALL        _resposta2+0, 0
	BCF         PORTC+0, 3 
	BCF         PORTC+0, 5 
L_main92:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _perg+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main139
	MOVF        _perg+0, 0 
	SUBLW       5
L__main139:
	BTFSS       STATUS+0, 0 
	GOTO        L_main93
	INFSNZ      _perg+0, 1 
	INCF        _perg+1, 1 
	CLRF        _btj2+0 
	CLRF        _btj2+1 
	BCF         PORTC+0, 3 
	GOTO        L_main94
L_main93:
	MOVLW       1
	MOVWF       _perg+0 
	MOVLW       0
	MOVWF       _perg+1 
	CLRF        _btj2+0 
	CLRF        _btj2+1 
	BCF         PORTC+0, 3 
L_main94:
L_main87:
	GOTO        L_main71
L_end_main:
	GOTO        $+0
; end of _main
