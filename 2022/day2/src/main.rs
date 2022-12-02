use std::fs;
use std::io::BufReader;
use std::io::prelude::*;

fn main() {
    // Read the input file
    let file_path = "input.txt";
    let file = fs::File::open(file_path)
        .expect("Error opening file");

    let mut reader = BufReader::new(file);

    // running total to keep track of score
    let mut sum = 0;

    // Read the file line by line
    let mut line = String::new();
    while reader.read_line(&mut line).unwrap() > 0 {
        // Remove trailing "\n" and update running sum
        line.pop();

        // catch edge case where line is empty (end of file)
        if line.len() == 0 {
            continue;
        }

        match line.as_bytes()[0] {
            // Opponent picks Rock
            65 => {
                match line.as_bytes()[2] {
                    // We need to loose with picking scissors
                    88 => {
                        sum = sum + 3;
                    },
                    // We need to tie with picking rock
                    89 => {
                        sum = sum + 1;
                        sum = sum + 3;
                    },
                    // We need to win with picking paper
                    90 => {
                        sum = sum + 2;
                        sum = sum + 6;
                    },
                    _ => println!("ERROR found other letters"),
                }
            },

            // Opponent picks paper
            66 => {
                match line.as_bytes()[2] {
                    // We need to loose with picking rock
                    88 => {
                        sum = sum + 1;
                    },
                    // We need to tie with picking paper
                    89 => {
                        sum = sum + 2;
                        sum = sum + 3;
                    },
                    // We need to win with picking scissors
                    90 => {
                        sum = sum + 3;
                        sum = sum + 6;
                    },
                    _ => println!("ERROR found other letters"),
                }
            },

            // Opponent picks scissors
            67 => {
                match line.as_bytes()[2] {
                    // We need to loose by picking paper
                    88 => {
                        sum = sum + 2;
                    },
                    // We need to tie by picking scissors
                    89 => {
                        sum = sum + 3;
                        sum = sum + 3;
                    },
                    // We need to win by picking rock
                    90 => {
                        sum = sum + 1;
                        sum = sum + 6;
                    },
                    _ => println!("ERROR found other letters"),
                }
            },

            _ => println!("ERROR found wildcard in first column"),
        }

        // Clear the line string for the next iteration
        line.clear();
    }

    println!("{}", sum);
}
