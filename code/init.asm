;==============================================================================
; INITIALIZE PARAMS & START 
;==============================================================================

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
					; Memory Configuration
					;-----------------------
					; Set CPU Data Direction Register (DDR) 
					; Set bits 0-2 as output
					;-----------------------
						lda #$07		
						sta $00		
					;-------------------------------		
					; Processor Port Register
					;-------------------------------		
					; Bits
					;-------------------------------		
					; 0: CHAREN = BASIC ROM at $A000–$BFFF replaced by RAM 
					; 1: HIRAM 	= KERNAL ROM at $E000–$FFFF replaced by RAM
					; 2: LORAM 	= Char ROM visible at $D000–$DFFF (I/O hidden)
					;-------------------------------			
					;              o- LORAM 
					;		       |o- HIRAM
					;              ||o- CHAREN
					;              |||
					;-------------------------------			
						lda #%00000101		
						sta $01		
					;-------------------------------			

						cli
		
-          	    	 	inc $d020
						dec $d020
						jmp -
						rts
						