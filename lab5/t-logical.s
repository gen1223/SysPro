@ test-logical
.text
_start:
    .global _start
    eor r0, r1, r0
    asr r0, r0, #17
    and r0, #0x1e, lsl #8
@    and r0, r0, #251658240
    bx lr
.end
