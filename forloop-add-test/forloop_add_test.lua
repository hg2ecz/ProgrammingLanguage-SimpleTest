#!/usr/bin/env luajit

function main(toval)
    local sumval = 0
    for i = 0, toval-1 do
        for j = 0, toval-1 do
            sumval = sumval + i+(j^1)
        end
    end
    print("Luajit:", sumval);
end

main( tonumber(arg[1]) )
