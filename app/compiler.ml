(******************************************************************************)
(*                                                                            *)
(*                                  ProcessingML                              *)
(*                                  Basile Pesin                              *)
(*              This project is licensed under the GNU LGPLv3.0               *)
(*                                                                            *)
(******************************************************************************)

(** Compilation of sketches *)

exception CompilationException

let create_build_folder (buildPath: string): unit =
  try Unix.mkdir buildPath 0o777;
  with Unix.Unix_error(Unix.EEXIST, _, _) -> ()

let create_sketch_file (buildPath: string) (moduleName: string): unit =
  let chan = open_out (Printf.sprintf "%s/sketch.ml" buildPath) in
  output_string chan "open LibPML.Input\n";
  output_string chan (Printf.sprintf "open %s\n" moduleName);
  output_string chan
    "let _ = let rstart = ref (setup ()) in\n\
     Graphics.auto_synchronize false;\n\
     let mt = Mutex.create () in\n\
     let rec handle_event rs =\n\
     let evstat = Graphics.wait_next_event [Graphics.Button_down; Graphics.Key_pressed] in\n\
     (if evstat.keypressed then (Mutex.lock mt; rs := key_pressed !rs; Mutex.unlock mt)\n\
     else (Mutex.lock mt; rs := mouse_clicked !rs; Mutex.unlock mt);\n\
     handle_event rs) in\n\
     ignore (Thread.create handle_event rstart);\n\
     let rec draw_rec rs =\n\
     Unix.sleepf (1./.60.);\n\
     Mutex.lock mt;\
     rs := draw !rs; Graphics.synchronize ();\
     Mutex.unlock mt; draw_rec rs in\n\
     draw_rec rstart";
  close_out chan

let compile filePath =
  (* Get module name and file path *)
  let revFilePath = List.rev filePath in
  let fileName = List.hd (String.split_on_char '.' (List.hd revFilePath))
  and revFilePath = List.tl revFilePath in
  if fileName <> List.hd revFilePath
  then failwith (Printf.sprintf "Sketch '%s' should be in a folder of the same name" fileName);
  let moduleName = String.capitalize_ascii fileName
  and filePath = String.concat "/" (List.rev revFilePath) in

  (* Create _build folder, and wait for it to exist *)
  let buildPath = Printf.sprintf "%s/_build" filePath in
  create_build_folder buildPath;

  (* Compile the specific sketch *)
  if (Sys.command (Printf.sprintf "ocamlfind ocamlc -package processingml -c -o %s/%s.cmo graphics.cma unix.cma libPML.cma %s/%s.ml"
                         buildPath fileName filePath fileName)) <> 0 then raise CompilationException;

  (* Create a file containing call to main methods, and compile it *)
  create_sketch_file buildPath moduleName;

  (* Compile whole sketch *)
  if (Sys.command (Printf.sprintf "ocamlfind ocamlc -package processingml -I %s -I +threads -o %s/%s.exe graphics.cma unix.cma threads.cma libPML.cma %s/%s.cmo %s/sketch.ml"
                         buildPath buildPath fileName buildPath fileName buildPath)) <> 0 then raise CompilationException;

  (* Creates symlink in the main folder *)
  try Unix.symlink (Printf.sprintf "_build/%s.exe" fileName)
        (Printf.sprintf "%s/%s.exe" filePath fileName)
  with Unix.Unix_error (Unix.EEXIST, _, _) -> ()

let clean filePath =
  let folderPath = List.rev (List.tl (List.rev filePath))
  and exeName = List.hd (String.split_on_char '.' (List.hd (List.rev filePath))) in
  (try
    Sys.remove (Printf.sprintf "%s/%s.exe" (String.concat "/" folderPath) exeName)
  with Sys_error _ -> ());
  ignore (Sys.command (Printf.sprintf "rm -rf %s/_build" (String.concat "/" folderPath)))
