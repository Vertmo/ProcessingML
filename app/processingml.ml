(******************************************************************************)
(*                                                                            *)
(*                                  ProcessingML                              *)
(*                                  Basile Pesin                              *)
(*              This project is licensed under the GNU LGPLv3.0               *)
(*                                                                            *)
(******************************************************************************)

(** Main module, containing interpretation for command line arguments *)

let usage = "usage: " ^ Sys.argv.(0) ^ " [--run] [--build] <input_file>"

type steps = Run | Build | Clean

let step = ref Run

let speclist = [
  ("--run", Arg.Unit (fun () -> step := Run), ": Compile and run a sketch (default)");
  ("--build", Arg.Unit (fun () -> step := Build), ": Compile a sketch");
  ("--clean", Arg.Unit (fun () -> step := Clean), ": Clean the _build folder of the sketch")
]

let find_sketch_from_path filename =
  if not (Sys.file_exists filename) then failwith (Printf.sprintf "File %s does not exist !" filename);
  String.split_on_char '/' filename

let main filename step =
  let filepath = find_sketch_from_path filename in
  if step = Clean then Compiler.clean filepath else (
    Compiler.compile filepath;
    if step = Run then Runner.run filepath else print_endline "Sketch compiled"
  )

let _ = Arg.parse speclist (fun x -> main x !step) usage
