fun main(args: Array<String>) {
    var toval = args[0].toLong()
    var sumval: Long = 0
    for (i in 0..toval-1) {
        for (j in 0..toval-1) {
            sumval += i + (j xor 1)
        }
    }
    println("Kotlin: $sumval");
}
