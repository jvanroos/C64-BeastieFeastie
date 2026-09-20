
                *=START

                sei
            ;-----------------------    
            ; disable CIA timers    
            ;-----------------------    
                lda #$7f    
                sta $dc0d
                sta $dd0d
            ;-----------------------    
            ; clear pending CIA IRQ's   
            ;-----------------------    
                lda $dc0d               
                lda $dd0d
            ;-----------------------    
            ; Screen Setup  
            ;-----------------------
            ; Enable Video Bank Selection    
            ;-----------------------    
                lda $dd02
                ora #%00000011
                sta $dd02
            ;-----------------------    
            ; Select VIC Bank
            ;-----------------------    
                lda $dd00
                and #%11111100
                ora #BANK_0                         ; standaard video bank $0000-$3fff
                sta $dd00                           ; screen on $0400
            ;-----------------------
            ; Select CHAR Bank    
            ;-----------------------   
                lda $d018
                and #%11110001 
                ora #CHARBANK_2
                sta $d018                           ; chars on $1000
            ;-----------------------  
            ; Set Control Register  
            ;-----------------------
            ; Bits
            ;-----------------------
            ; 0-2: X-Scroll
            ;   3: Colum Selection (1 = 40,  0 = 38)
            ;   4: MultiColorMode  (0 = Off, 1 = On)
            ;   5: Res
            ;   6: -
            ;   7: -  
            ;-----------------------
                lda $d016
                and #%11001000                      ; 40 Colums, MultiColor Mode Off
                sta $d016
            ;-----------------------

                cli

-               inc $d020
                dec $d020
                jmp -
                rts
                