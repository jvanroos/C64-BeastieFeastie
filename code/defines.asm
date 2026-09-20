;-------------------------------
; Beastie Feastie
;-------------------------------
; Memory locations
;-------------------------------
START       = $8009
BASIC       = $0801 
BITMASKS    = $0880
SPRPTR		= $03f8		
SCREEN		= $4000	
COLORRAM	= $d800
;-------------------------------		
; VIC BANK		
;-------------------------------		
; BANK 0 - xxxxxx11 $0000-$3FFF		
; BANK 1 - xxxxxx10 $4000-$7FFF		
; BANK 2 - xxxxxx01 $8000-$BFFF		
; BANK 3 - xxxxxx00 $C000-$FFFF		
;-------------------------------		
BANK_0	    = %00000011
BANK_1	    = %00000010
BANK_2	    = %00000001
BANK_3	    = %00000000
;-------------------------------;
; CHAR BANKS
;-------------------------------;
; $D018 = %xxxx000x $0000	    ; $00
; $D018 = %xxxx001x $0800	    ; $02
; $D018 = %xxxx010x $1000	    ; $04
; $D018 = %xxxx011x $1800	    ; $06
; $D018 = %xxxx100x $2000	    ; $08
; $D018 = %xxxx101x $2800	    ; $0a
; $D018 = %xxxx110x $3000	    ; $0c				
; $D018 = %xxxx111x $3800	    ; $0e	
;-------------------------------;
CHARBANK_0	= %00000000		    ; $0000	= $00
CHARBANK_1	= %00000010		    ; $0800	= $02
CHARBANK_2	= %00000100		    ; $1000	= $04
CHARBANK_3	= %00000110		    ; $1800	= $06
CHARBANK_4	= %00001000		    ; $2000	= $08
CHARBANK_5	= %00001010		    ; $2800	= $0a
CHARBANK_6	= %00001100		    ; $3000	= $0c
CHARBANK_7	= %00001110		    ; $3800	= $0e
;----------------------------------------------------------------------------------------------------------------------------
; Zero Page
;----------------------------------------------------------------------------------------------------------------------------
; $0001
; default: #$00110111 (#$37)
;----------------------------------------------------------------------------------------------------------------------------
; Processor port. Bits:
; Bits #0-2: Configuration for memory areas $A000-$BFFF, $D000-$DFFF and $E000-$FFFF. 
;   %x00: RAM visible in all three areas.
;   %x01: RAM visible at $A000-$BFFF and $E000-$FFFF.
;   %x10: RAM visible at $A000-$BFFF; KERNAL ROM visible at $E000-$FFFF.
;   %x11: BASIC ROM visible at $A000-$BFFF; KERNAL ROM visible at $E000-$FFFF.
;   %0xx: Character ROM visible at $D000-$DFFF. (Except for the value %000, see above.)
;   %1xx: I/O area visible at $D000-$DFFF. (Except for the value %100, see above.)
; Bit #3: Datasette output signal level.
; Bit #4: Datasette button status; 0 = One or more of PLAY, RECORD, F.FWD or REW pressed; 1 = No button is pressed.
; Bit #5: Datasette motor control; 0 = On; 1 = Off. Default: $37, %00110111.
;----------------------------------------------------------------------------------------------------------------------------