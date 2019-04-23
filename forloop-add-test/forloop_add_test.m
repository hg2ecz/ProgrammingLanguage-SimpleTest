#!/usr/bin/env -S octave -q

felesleges_de_kell_ide_egy_ertekadas = 0;

function main(toval)
    sumval = 0;
    for i = 0 : toval-1
        for j = 0 : toval-1
            sumval = sumval + i+(j^1);
        endfor
    endfor
    printf("Octave: %d\n", sumval);
end

main( str2num(argv(){1}) );
