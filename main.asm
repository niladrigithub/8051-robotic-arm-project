; main.asm - Main program for 8051 Robotic Arm Project

ORG 0H        ; Set the origin to 0H, the default start address for 8051

START:        ; Start of the program

    MOV P1, #00H  ; Initialize Port 1 (adjust based on your hardware setup)
    MOV P2, #00H  ; Initialize Port 2 (adjust based on your hardware setup)

MAIN_LOOP:    ; Main loop of the program

    ; Your main program logic goes here
    ; Example: Control the robotic arm based on input or sensor readings

    NOP         ; No operation (placeholder)

    SJMP MAIN_LOOP ; Jump back to the main loop

    END START   ; End of the program
