.extern delay

.text
.global eureka

.macro pushall
  push r16
  push r17
  push r18
  push r19
  push r20
  push r21
  push r22
  push r23
  push r24
  push r25
  push r26
  push r27
  push r28
  push r29
  push r30
  push r31
.endm ; of pushall

.macro popall
  pop r31
  pop r30
  pop r29
  pop r28
  pop r27
  pop r26
  pop r25
  pop r24
  pop r23
  pop r22
  pop r21
  pop r20
  pop r19
  pop r18
  pop r17
  pop r16
.endm ; of popall

.equ DDRB, 0x04
.equ PORTB, 0x05
;.  ..-  .-.  .  -.-  .-

eureka:

  ldi r26, 0b0110001
  ldi r27, 0b0000000
  
  ldi r18, 0b00100000
  out DDRB, r18

  out PORTB, r26
  call dShort
  out PORTB, r27
  
  call dSpace
  
  out PORTB, r26
  call dShort
  out PORTB, r27
  
  call dBetween
  
  out PORTB, r26
  call dShort
  out PORTB, r27

  call dBetween
  
  out PORTB, r26
  call dLong
  out PORTB, r27

  call dSpace

  out PORTB, r26
  call dShort
  out PORTB, r27

  call dBetween

  out PORTB, r26
  call dLong
  out PORTB, r27

  call dBetween
  
  out PORTB, r26
  call dShort
  out PORTB, r27

  call dSpace

  out PORTB, r26
  call dShort
  out PORTB, r27

  call dSpace

  out PORTB, r26
  call dLong
  out PORTB, r27

  call dBetween
  
  out PORTB, r26
  call dShort
  out PORTB, r27

  call dBetween
  
  out PORTB, r26
  call dLong
  out PORTB, r27

  call dSpace
  
  out PORTB, r26
  call dShort
  out PORTB, r27

  call dBetween
  
  out PORTB, r26
  call dLong
  out PORTB, r27


  ; delay for next iteration
  pushall
  ldi  r22, 0x00
  ldi  r23, 0x0F
  ldi  r24, 0x00
  ldi  r25, 0x00
  call delay
  popall
  

dShort:
  pushall
  ldi  r22, 0xf4
  ldi  r23, 0x01
  ldi  r24, 0x00
  ldi  r25, 0x00
  call delay
  popall
  ret
  
dLong:
  pushall
  ldi  R22, 0xdc
  ldi  R23, 0x05
  ldi  R24, 0x00
  ldi  R25, 0x00
  call delay
  popall
  ret

dSpace:
  pushall
  ldi  R22, 0xdc
  ldi  R23, 0x05
  ldi  R24, 0x00
  ldi  R25, 0x00
  call delay
  popall
  ret

dBetween:
  pushall
  ldi  R22, 0xFA
  ldi  R23, 0x00
  ldi  R24, 0x00
  ldi  R25, 0x00
  call delay
  popall
  ret
ret
