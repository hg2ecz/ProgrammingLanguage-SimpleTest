use std::collections::HashSet;

fn remove_dup_words(s: &str) -> String {
    let mut wordlist: HashSet<&str> = HashSet::new();
    let mut v: Vec<&str> = Vec::new();

    for word in s.split_whitespace() {
        if wordlist.insert(word) {
            v.push(word)
        }
    }
    v.join(" ")
}

fn main() {
    let args: Vec<String> = std::env::args().collect();
    if args.len() != 3 {
        eprintln!("Parameters: filename repeat_of_test");
        std::process::exit(1);
    }

    let filename = &args[1];
    let repeat: i32 = args[2].parse().unwrap();

    let contents = std::fs::read_to_string(filename).unwrap();
    let mut res = String::new();

    for _ in 0..repeat {
        res = remove_dup_words(&contents);
    }
    println!("{}", res);
    eprintln!("Rust");
}
