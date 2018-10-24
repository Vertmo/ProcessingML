(******************************************************************************)
(*                                                                            *)
(*                                  ProcessingML                              *)
(*                                  Basile Pesin                              *)
(*              This project is licensed under the GNU LGPLv3.0               *)
(*                                                                            *)
(******************************************************************************)

let size x y =
  Graphics.open_graph (Printf.sprintf " %ix%i" x y);
  let execPath = String.split_on_char '/' (Sys.executable_name) in
  let execName = List.hd (List.rev execPath) in
  let sketchName = String.capitalize_ascii (List.hd (String.split_on_char '.' execName)) in
  Graphics.set_window_title sketchName

let width = Graphics.size_x

let height = Graphics.size_y
