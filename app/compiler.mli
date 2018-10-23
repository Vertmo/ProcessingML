(******************************************************************************)
(*                                                                            *)
(*                                  ProcessingML                              *)
(*                                  Basile Pesin                              *)
(*              This project is licensed under the GNU LGPLv3.0               *)
(*                                                                            *)
(******************************************************************************)

(** Compilation of sketches *)

(** Exception occuring when compilation fails *)
exception CompilationException

(** {! compile f} compiles the file located at path [f] *)
val compile : string list -> unit

(** {! clean f} cleans the _build folder of skectch [f] *)
val clean : string list -> unit
