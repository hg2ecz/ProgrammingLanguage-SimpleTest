#! /usr/bin/gforth

\ help: https://1scyem2bunjw1ghzsf1cjwwn-wpengine.netdna-ssl.com/wp-content/uploads/2018/01/Starting-FORTH.pdf

: MAIN
  0          \ acc

  20000 0 do \ begin outer loop
  I          \ push ct#1
  swap       \ acc top of the stack

  20000 0 do \ begin inner loop
  over +     \ clone ct#1 up and add to acc#1
  I 1 xor +  \ acc += loopcnt^1
  loop       \ end of inner loop

  swap       \ ct#1 top of the stack
  drop       \ drop ct#1
  loop       \ end of outer loop
  .          \ print acc
;

MAIN
cr
bye
