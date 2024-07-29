STACK SEGMENT PARA STACK
    DB 64 DUP (' ')
STACK ENDS

DATA SEGMENT PARA 'DATA'
    BALL_X DW 0Ah ; x pos
    BALL_Y DW 0Ah ; y pos
    BALL_SIZE DW 04h ;ball size
DATA ENDS

CODE SEGMENT PARA 'CODE'
 
    MAIN PROC FAR
    ASSUME CS:CODE,DS:DATA,SS:STACK
    PUSH DS
    SUB AX,AX
    PUSH AX
    MOV AX,DATA
    MOV DS,AX
    POP AX
    POP AX

        MOV AH,00h ;seting video mode
        MOV AL,13h ;choosing the video mode
        INT 10h
        
        MOV AH,0Bh 
        MOV BH,00h ;background config
        MOV BL,00h ;black
        INT 10h

        CALL DRAW_BALL

        RET
    MAIN ENDP

    DRAW_BALL PROC NEAR
        
        MOV CX,BALL_X ;initial x column
        MOV DX,BALL_Y ;initial Y row

        DRAW_BALL_HORIZONTAL:
            MOV AH,0Ch 
            MOV AL,0Fh ; white as pixel color
            MOV BH,00h ; setting up the page number
            INT 10h
            INC CX

            MOV AX,CX
            SUB AX,BALL_X
            CMP AX, BALL_SIZE
            JNG DRAW_BALL_HORIZONTAL

            MOV CX,BALL_X
            INC DX

            MOV AX,DX
            SUB AX,BALL_Y
            CMP AX,BALL_SIZE
            JNG DRAW_BALL_HORIZONTAL


        RET
    DRAW_BALL ENDP
CODE ENDS

END
