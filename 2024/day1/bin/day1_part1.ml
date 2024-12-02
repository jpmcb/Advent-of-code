let () =
  print_endline "Day 1 - part 1!";

  (* Prompt user for the input file name *)
  print_endline "Enter the file name:";
  let filename = read_line () in

  let left = ref [] in
  let right = ref [] in

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
            left := int_of_string l :: !left;
            right := int_of_string r :: !right
        | _ -> Printf.eprintf "Skipping invalid line: %s\n" line
      done
    with End_of_file ->
      close_in ic;

      (* Sort the collected lists *)
      let sorted_left = List.sort compare (List.rev !left) in
      let sorted_right = List.sort compare (List.rev !right) in

      (* Compute the total distance between corresponding elements *)
      let rec compute_distance l1 l2 acc =
        match (l1, l2) with
        | ([], []) -> acc
        | (x :: xs, y :: ys) ->
            let distance = abs (x - y) in
            compute_distance xs ys (acc + distance)
        | _ -> failwith "Lists are not the same length" (* This won't occur in this case *)
      in

      let total_distance = compute_distance sorted_left sorted_right 0 in
      Printf.printf "Total distance: %d\n" total_distance
  with Sys_error err ->
    Printf.eprintf "Error: %s\n" err
