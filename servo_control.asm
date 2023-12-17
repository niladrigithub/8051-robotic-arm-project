; servo_control.asm - Servo motor control using 8051

ORG 30H        ; Set the origin to 30H (adjust based on your specific needs)

SERVO_DELAY EQU 30000 ; Adjust this value for the desired delay

START:        ; Start of the program

    MOV TMOD, #01H ; Set Timer 0 in mode 1 (16-bit timer)

SERVO_LOOP:   ; Servo motor control loop

    MOV TH0, #0FFH ; Load high byte of the timer with 0xFF
    MOV TL0, #0D1H ; Load low byte of the timer with 0xD1 (adjust for your desired pulse width)

    SETB P1.0      ; Set P1.0 high to start the pulse

    SETB TR0       ; Start Timer 0

WAIT_LOOP:     ; Wait loop

    JNB TF0, WAIT_LOOP ; Wait until Timer 0 overflows

    CLR TR0        ; Stop Timer 0
    CLR TF0        ; Clear Timer 0 overflow flag
    CLR P1.0       ; Clear P1.0 to end the pulse

    NOP            ; Optional: Add NOP instructions for timing adjustments
    NOP

    ACALL DELAY    ; Call the delay subroutine

    SJMP SERVO_LOOP ; Jump back to the servo control loop

DELAY:          ; Delay subroutine

    MOV R2, #00H  ; Initialize outer loop counter

DELAY_LOOP1:

    MOV R1, #00H  ; Initialize inner loop counter

DELAY_LOOP2:

    NOP            ; No operation (adjust as needed)

    DJNZ R1, DELAY_LOOP2 ; Decrement inner loop counter and repeat if not zero

    DJNZ R2, DELAY_LOOP1 ; Decrement outer loop counter and repeat if not zero

    RET            ; Return from the subroutine

    END START     ; End of the program
