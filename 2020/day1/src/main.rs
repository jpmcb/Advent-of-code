use std::fs::File;
use std::io::{self, prelude::*, BufReader};
use std::process;

fn main() -> io::Result<()> {
    let file = File::open("input.txt")?;
    let reader = BufReader::new(file);

    let mut vec = Vec::new();

    for line in reader.lines() {
        let num: i32 = line?.parse().unwrap();
        vec.push(num)
    }

    for num_a in &vec {
        for num_b in &vec {
            for num_c in &vec {
                if (num_a + num_b + num_c) == 2020 {
                    println!("{}", num_a * num_b * num_c);
                    process::exit(0);
                }
            }
        }
    }

    Ok(())
}
