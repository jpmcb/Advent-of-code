use std::fs;
use std::io;
use std::io::BufReader;
use std::io::prelude::*;

fn main() {
    // Read the input file
    let file_path = "input.txt";
    let file = fs::File::open(file_path)
        .expect("Error opening file");

    let mut reader = BufReader::new(file);

    // self managed stack
    let mut first = 0;
    let mut second = 0;
    let mut third = 0;

    // running total to keep track of each chunk
    let mut sum = 0;

    // Read the file line by line
    let mut line = String::new();
    while reader.read_line(&mut line).unwrap() > 0 {
        // If we've hit the newline, it's time to evaluate if we have a
        // higher calorie running total then what's in the 3 slot stack
        if line == "\n" {
            // Biggest running total so far.
            // Update sum to point to this number to bump it down the stack
            if sum >= first {
                let tmp = first;
                first = sum;
                sum = tmp;
            }

            // Second biggest running total.
            // Update sum to point to this number to bump it down the stack
            if sum >= second {
                let tmp = second;
                second = sum;
                sum = tmp;
            }

            // Third total.
            // No need to update sum since we can be assured we'll drop this
            // from our self managed stack
            if sum >= third {
                third = sum;
            }

            sum = 0;
        } else {
            // Remove trailing "\n" and update running sum
            line.pop();
            let i = line.parse::<i32>().unwrap();
            sum = sum + i;
        }

        // Clear the line string for the next iteration
        line.clear();
    }

    println!("First: {}", first);
    println!("Second: {}", second);
    println!("Third: {}", third);

    println!("Result: {}", first + second + third);
}
