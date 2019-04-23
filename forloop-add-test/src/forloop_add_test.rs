// rust -O forloop-add-test.rs

use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    let toval: i64 = args[1].parse().unwrap();
    let mut sumval = 0;
    for i in 0..toval {
        for j in 0..toval {
            sumval += i+(j^1);
        }
    }
    println!("Rust: {}", sumval);
}

