import std.stdio;
import std.conv;

void main(string[] args) {
    long toval = to!long(args[1]);
    long i, j, sumval = 0;
    for (i=0; i<toval; i++) {
        for (j=0; j<toval; j++) {
            sumval += i+(j^1);
        }
    }
    writefln("D: %d\n", sumval);
}
