#!/usr/bin/env pypy3

import sys

def remove_dup_words(s: str) -> str:
    wordlist = set()
    v = []

    for word in s.split():
        if word not in wordlist:
            wordlist.add(word)    # in Rust HashSet.insert() return True or False
            v.append(word)

    return ' '.join(v)

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print("Parameters: filename repeat_of_test", file=sys.stderr)
        sys.exit(1)

    filename = sys.argv[1];
    repeat = int(sys.argv[2])

    contents = open(filename, "r").read()

    for _ in range(repeat):
        res = remove_dup_words(contents);

    print(res);
    print("Python", file=sys.stderr);
