#!/usr/bin/env Rscript

main <- function(toval) {
    sumval <- 0
    for (i in 0:(toval-1)){
        for (j in 0:(toval-1)){
            sumval <- sumval + i + (j^1)
        }
    }
    message("r: ", sumval)
}

args <- commandArgs(trailingOnly=TRUE)
main( as.numeric(args[1]) )
