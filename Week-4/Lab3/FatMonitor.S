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
      ldi r28, 0xFF
      out 0x05, r24
      ret
      maleFatLessThanThirty:
        CPI r20, 25
        BRLT maleFatLessThanTwentyFive
        ; fat high
        out 0x05, r23
        ret
        maleFatLessThanTwentyFive:
          CPI r20, 13
          BRLT maleFatLessThanThirteen
          ; fat normal
          out 0x05, r22
          ret
          maleFatLessThanThirteen:
            ; fat low
            out 0x05, r21
            ret
      ret
      maleAgeLessThanSixty:
        CPI r19, 40
        BRLT maleAgeLessThanForty
        ; do something for 40-59
        CPI r20, 28
        BRLT maleFatLessThanTwentyEight
        ; fat very high
        out 0x05, r24
        ret
        maleFatLessThanTwentyEight:
          CPI r20, 22
          BRLT maleFatLessThanTwentyTwo
          ; fat high
          out 0x05, r23
          ret
          maleFatLessThanTwentyTwo:
            CPI r20, 11
            BRLT maleFatLessThanEleven
            ; fat normal
            out 0x05, r22
            ret
            maleFatLessThanEleven:
              ; fat low
              out 0x05, r21
              ret
        ret
        maleAgeLessThanForty:
          CPI r19, 20
          BRLT maleAgeLessThanTwenty
          ; do something 20-39
          CPI r20, 25
          BRLT maleFatLessThanTwentyFive2
          ; fat very high
          out 0x05, r24
          ret
          maleFatLessThanTwentyFive2:
            CPI r20, 22
            BRLT maleFatLessThanTwenty
            ; fat high
            out 0x05, r23
            ret
            maleFatLessThanTwenty:
              CPI r20, 8
              BRLT maleFatLessThanEight
              ; fat normal
              out 0x05, r22
              ret
              maleFatLessThanEight:
                ; fat low
                out 0x05, r21
                ret
        ret
        maleAgeLessThanTwenty:
          ; do nothing for <20
          ret
      ret
    out 0x05, r21
    ret
  
  ifFemale:
    CPI r19, 79
    BRLT femaleAgeLessThanSeventyNine
    ret
    femaleAgeLessThanSeventyNine:
      CPI r19, 60
      BRLT femaleAgeLessThanSixty
      ; do something for 60-79
      CPI r20, 42
      BRLT femaleFatLessThanFortyTwo
      ; fat very high
      out 0x05, r24
      ret
      femaleFatLessThanFortyTwo:
        CPI r20, 36
        BRLT femaleFatLessThanThirtySix
        ; fat high
        out 0x05, r23
        ret
        femaleFatLessThanThirtySix:
          CPI r20, 24
          BRLT femaleFatLessThanTwentyFour
          ; fat normal
          out 0x05, r22
          ret
          femaleFatLessThanTwentyFour:
            ; fat low
            out 0x05, r21
            ret
      ret
      femaleAgeLessThanSixty:
        CPI r19, 40
        BRLT femaleAgeLessThanForty
        ; do something for 40-59
        CPI r20, 40
        BRLT femaleFatLessThanForty
        ; fat very high
        out 0x05, r24
        ret
        femaleFatLessThanForty:
          CPI r20, 34
          BRLT femaleFatLessThanThirtyFour
          ; fat high
          out 0x05, r23
          ret
          femaleFatLessThanThirtyFour:
            CPI r20, 23
            BRLT femaleFatLessThanTwentyThree
            ; fat normal
            out 0x05, r22
            ret
            femaleFatLessThanTwentyThree:
              ; fat low
              out 0x05, r21
              ret
        ret
        femaleAgeLessThanForty:
          CPI r19, 20
          BRLT femaleAgeLessThanTwenty
          ; do something 20-39
          CPI r20, 39
          BRLT femaleFatLessThanThirtyNine
          ; fat very high
          out 0x05, r24
          ret
          femaleFatLessThanThirtyNine:
            CPI r20, 33
            BRLT femaleFatLessThanThirtyThree
            ; fat high
            out 0x05, r23
            ret
            femaleFatLessThanThirtyThree:
              CPI r20, 21
              BRLT femaleFatLessThanTwentyOne
              ; fat normal
              out 0x05, r22
              ret
              femaleFatLessThanTwentyOne:
                ; fat low
                out 0x05, r21
                ret
        ret
        femaleAgeLessThanTwenty:
          ; do nothing for <20
          ret
      ret
    out 0x05, r21
    ret
  ret
