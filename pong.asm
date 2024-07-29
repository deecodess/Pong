STACK SEGMENT PARA STACK
    DB 64 DUP (' ')
STACK ENDS

DATA SEGMENT PARA 'DATA'
    BALL_X DW 0Ah ; x pos
    BALL_Y DW 0Ah ; y pos
DATA ENDS

CODE SEGMENT PARA 'CODE'
 
    MAIN PROC FAR
        MOV AH,00h ;seting video mode
        MOV AL,13h ;choosing the video mode
        INT 10h
        
        MOV AH,0Bh 
        MOV BH,00h ;background config
        MOV BL,00h ;black
        INT 10h

        MOV AH,0Ch 
        MOV AL,0Fh ; white as pixel color
        MOV BH,00h ; setting up the page number
        MOV CX,BALL_X ;x column
        MOV DX,BALL_Y ;Y row
        INT 10h

        RET
    MAIN ENDP
CODE ENDS

END
