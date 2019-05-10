using System;
using System.IO;
using System.Linq;

class Program {
    static (string WordList, int Count) remove_dup_words(string inputString) {
        var wordlist = inputString.Split()
                                  .Where(s => !string.IsNullOrWhiteSpace(s))
                                  .ToHashSet();

        return (WordList: string.Join(" ", wordlist), Count: wordlist.Count);
    }


    static void Main(string[] args) {
        if (args.Length != 2) {
            Console.Error.WriteLine("Parameters: filename repeat_of_test");
            System.Environment.Exit(1);
        }

        var filename = args[0];
        var repeat = Int32.Parse(args[1]);

        var contents = File.ReadAllText(filename);
        (string WordList, int Count) result = (null, 0);

        for (int i = 0; i < repeat; i++) {
            result = remove_dup_words(contents);
        }

        Console.WriteLine($"{result.WordList}");
        Console.Error.WriteLine("CSharp");
    }
}
