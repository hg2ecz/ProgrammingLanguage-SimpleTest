#!/usr/bin/env ruby

def main(toval)
    sumval = 0
    for i in 0 .. toval-1
        for j in 0 .. toval-1
            sumval += i+(j^1)
        end
    end
    print 'Ruby: ', sumval, "\n"
end

main ( ARGV[0].to_i )
