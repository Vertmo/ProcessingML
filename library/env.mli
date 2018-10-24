(******************************************************************************)
(*                                                                            *)
(*                                  ProcessingML                              *)
(*                                  Basile Pesin                              *)
(*              This project is licensed under the GNU LGPLv3.0               *)
(*                                                                            *)
(******************************************************************************)

(** Environment primitives *)

(** Opens the display window with set dimensions width and height *)
val size: int -> int -> unit

(** Returns width of the currently opened window *)
val width: unit -> int

(** Returns height of the currently opened window *)
val height: unit -> int
