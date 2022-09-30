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

;.  ..-  .-.  .  -.-  .-

eureka:

  ldi r26, 0b0110001
  ldi r27, 0b0000000
  
  ldi  R22, 0xb0
  ldi  R23, 0x00
  ldi  R24, 0x00
  ldi  R25, 0x00
  
  call dShort

  call dSpace

  call dLong
  call dLong
  call dShort

  call dSpace

  call dShort
  call dLong
  call dShort

  call dSpace

  call dShort

  call dSpace

  call dLong
  call dShort
  call dLong

  call dSpace

  call dShort
  call dLong
 

dShort:
  out 0x05, r26
  pushall
  ldi  R22, 0xb0
  ldi  R23, 0x00
  ldi  R24, 0x00
  ldi  R25, 0x00
  call delay
  popall
  out 0x05, r27

dLong:
  out 0x05, r26
  pushall
  ldi  R22, 0x00
  ldi  R23, 0x10
  ldi  R24, 0x00
  ldi  R25, 0x00
  call delay
  popall
  out 0x05, r27

dSpace:
  pushall
  ldi  R22, 0xb0
  ldi  R23, 0x03
  ldi  R24, 0x00
  ldi  R25, 0x00
  call delay
  popall

ret
