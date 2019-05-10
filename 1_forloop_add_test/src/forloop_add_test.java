class Forloop_add_test {
    public static void main(String[] args) {
        long toval = Long.parseLong(args[0], 10);
        long i, j, sumval = 0;
        for (i=0; i<toval; i++) {
            for (j=0; j<toval; j++) {
                sumval += i+(j^1);
            }
        }
        System.out.printf("Java: %d\n", sumval);
    }
}

