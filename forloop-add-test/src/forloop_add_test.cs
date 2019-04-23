public static class forloop_add_test {
    static void Main(string[] args) {
        long toval = long.Parse(args[0]);
        long i, j, sumval = 0;
        for (i=0; i<toval; i++) {
            for (j=0; j<toval; j++) {
                sumval += i+(j^1);
            }
        }
        System.Console.WriteLine("C# (mono): "+sumval);
    }
}

