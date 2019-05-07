var
    i, j, toval, sumval: sizeint;

begin
    val(paramstr(1),toval);
    sumval := 0;
    for i:=0 to toval-1 do
        for j:=0 to toval-1 do
            inc(sumval, i+(j xor 1));
    writeln('Pascal: ', sumval);
end.
