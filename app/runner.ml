(******************************************************************************)
(*                                                                            *)
(*                                  ProcessingML                              *)
(*                                  Basile Pesin                              *)
(*              This project is licensed under the GNU LGPLv3.0               *)
(*                                                                            *)
(******************************************************************************)

(** Execution of sketches *)

let run filePath =
  let revFilePath = List.rev filePath in
  let fileName = List.hd (String.split_on_char '.' (List.hd revFilePath)) in
  let filePath = List.rev (List.tl revFilePath) in
  ignore (Sys.command (Printf.sprintf "./%s/%s.exe"
                         (String.concat "/" filePath) fileName))
