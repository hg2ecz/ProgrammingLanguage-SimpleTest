#! /usr/bin/gforth

: MAIN
  0          \ acc#1
  20000 0 do \ begin outer loop
  20000 0 do \ begin inner loop
  I +        \ acc#1 + loopcnt
  I 1 xor +  \ acc#1 + loopcnt^1
  loop       \ end of inner loop
  loop       \ end of outer loop
  .          \ print acc#1
;

MAIN
CR
BYE
