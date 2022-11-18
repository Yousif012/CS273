.data
.text
  .global initSensor
  .global readSensor
  .global waitOneSecond

.equ DIDR0, 0x7E
.equ ADCSRA, 0x7A
.equ ADMUX, 0x7C
.equ ADSC, 6
.equ ADCH, 0x79

.equ TCNT1L, 0x84
.equ TCNT1H, 0x85
.equ OCR1AH, 0x89
.equ OCR1AL, 0x88
.equ TCCR1A, 0x80
.equ TCCR1B, 0x81
.equ TIFR1, 0x36
.equ OCF1A, 1

.equ TIMSK1, 0x6F
.equ TOIE1, 0


initSensor:
  ldi r18, 0b00111111
  sts DIDR0, r18
  ldi r18, 0b10000111
  sts ADCSRA, r18
  ret

readSensor:

  // Initialize ADMUX
  ldi r18, 0b01100000
  add r18, r24
  sts ADMUX, r18

  // Start conversion
  lds r18, ADCSRA
  ldi r19, 0b01000000
  or r18, r19
  sts ADCSRA, r18
  
  // Reading ADCSRA until it becomes 0
  loop:
    lds r18, ADCSRA
    SBRC r18, ADSC
    rjmp loop
  
  // Reading and Returning ADCH
  lds r24, ADCH
  clr r25

  ret

waitOneSecond:
  call timer
  ret


  


timer:
  ldi r20, 0x00
  sts TCNT1H, r20
  sts TCNT1L, r20

  ldi r18, 0x3D
  sts OCR1AH, r18
  ldi r18, 0x08
  sts OCR1AL, r18

  ldi r20, 0b00000000
  sts TCCR1A, r20
  ldi r20, 0b00001101
  sts TCCR1B, r20

  again:
    lds r20, TIFR1
    SBRS r20, OCF1A
    rjmp again
    ldi r20, 1<<OCF1A
    sts TIFR1, r20
    ldi r19, 0
    sts TCCR1B, r19
    sts TCCR1A, r19

  ret