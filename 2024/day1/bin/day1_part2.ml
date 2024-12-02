let () =
  print_endline "Day 1 - part 2!";

  (* Prompt user for the input file name *)
  print_endline "Enter the file name:";
  let filename = read_line () in

  (* Track left numbers *)
  let left = ref [] in

  (* Create hash table to track right side occurrences *)
  let right_counts = Hashtbl.create 100 in

  (* Function to increment a count in a hash table *)
  let increment_count tbl num =
    let current_count = Hashtbl.find_opt tbl num |> Option.value ~default:0 in
    Hashtbl.replace tbl num (current_count + 1)
  in

  (* Regex for splitting on three spaces *)
  let delimiter = Str.regexp "   " in

  (* Open the file and read lines *)
  try
    let ic = open_in filename in
    try
      while true do
        let line = input_line ic in
        (* match on split spaces for left and right number *)
        match Str.split delimiter line with
        | [l; r] ->
            let left_num = int_of_string l in
            let right_num = int_of_string r in
            (* Add to left list *)
            left := left_num :: !left;
            (* Update counts in table *)
            increment_count right_counts right_num
        | _ -> Printf.eprintf "Skipping invalid line: %s\n" line
      done
    with End_of_file ->
      close_in ic;

      (* Calculate the "similarity score" *)
      let similarity_score =
        List.fold_left
          (fun acc left_num ->
             let right_occurrence =
               Hashtbl.find_opt right_counts left_num |> Option.value ~default:0
             in
             acc + (left_num * right_occurrence))
          0
          !left
      in

      Printf.printf "Similarity score: %d\n" similarity_score
  with Sys_error err ->
    Printf.eprintf "Error: %s\n" err
