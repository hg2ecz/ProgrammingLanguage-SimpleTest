#!/usr/bin/env julia

function main(toval)
    local sumval = 0
    for i = 0:toval-1
        for j = 0:toval-1
            sumval = sumval + i+(j^1)
        end
    end
    println("Julia: ", sumval);
end

main( parse(Int, ARGS[1]) )
