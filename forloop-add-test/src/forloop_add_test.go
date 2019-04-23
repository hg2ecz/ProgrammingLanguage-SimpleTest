package main

import (
    "os"
    "fmt"
    "strconv"
)

func main() {
    var i, j, toval, sumval int64
    toval, err := strconv.ParseInt(os.Args[1], 10, 64)
    if err != nil { return }
    sumval = 0
    for i=0; i<toval; i++ {
        for j=0; j<toval; j++ {
            sumval += i+(j^1)
        }
    }
    fmt.Println("Go:", sumval)
}
