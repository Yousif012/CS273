.data
.comm gender,1
.global gender
.comm age,1
.global age
.comm fat,1
.global fat

.text
.global lightup

lightup:
  ldi r21, 0b0100000; blue LED (13)
  ldi r22, 0b0010000; green LED (12)
  ldi r23, 0b0000001; red LED (8)
  ldi r24, 0b0110001; all LEDs
  lds r18, gender
  lds r19, age
  lds r20, fat

  ldi r25, 0

  CPI r18, 0x0F 
  BREQ ifFemale
  
  CPI r18, 0x0A
  BREQ ifMale
  ret
  ifMale:
    CPI r19, 79
    BRLT maleAgeLessThanSeventyNine
    ret
    maleAgeLessThanSeventyNine:
      CPI r19, 60
      BRLT maleAgeLessThanSixty
      ; do something for 60-79
      CPI r20, 30
      BRLT maleFatLessThanThirty
      ; fat very high
      out 0x05, r24
      ret
      maleFatLessThanThirty:
        CPI r20, 25
        BRLT maleFatLessThanTwentyFive
        ; fat high
        ret
        maleFatLessThanTwentyFive:
          CPI r20
        
      
      ret
      maleAgeLessThanSixty:
        CPI r19, 40
        BRLT maleAgeLessThanForty
        ; do something for 40-59
        ret
        maleAgeLessThanForty:
          CPI r19, 20
          BRLT maleAgeLessThanTwenty
          ; do something 20-39
          ret
          maleAgeLessThanTwenty:
            ret
      
    out 0x05, r21
    ret
  
  ifFemale:
    out 0x05, r23
    ret
      
  ret
