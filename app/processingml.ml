(*******************************************r**********************************)
(*                                                                            *)
(*                                  ProcessingML                              *)
(*                                  Basile Pesin                              *)
(*              This project is licensed under the GNU LGPLv3.0               *)
(*                                                                            *)
(******************************************************************************)

(** Main module, containing interpretation for command line arguments *)

let usage = "usage: " ^ Sys.argv.(0) ^ " [--run] [--build] <input_file>"

type steps = Run | Build

let step = ref Run

let speclist = [
  ("--run", Arg.Unit (fun () -> step := Run), ": Compile and run a sketch (default)");
  ("--build", Arg.Unit (fun () -> step := Run), ": Compile a sketch")
]

let main filename _ = print_endline filename (* TODO *)

let _ = Arg.parse speclist (fun x -> main x step) usage
