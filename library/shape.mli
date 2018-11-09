(******************************************************************************)
(*                                                                            *)
(*                                  ProcessingML                              *)
(*                                  Basile Pesin                              *)
(*              This project is licensed under the GNU LGPLv3.0               *)
(*                                                                            *)
(******************************************************************************)

(** Drawing shapes *)

(** Draws an ellipse to the screen *)
val ellipse: int -> int -> int -> int -> unit

(** Draws a line to the screen *)
val line: int -> int -> int -> int -> unit

(** Draws a quadrilateral (4-sided polygon) to the screen *)
val quad: int -> int -> int -> int -> int -> int -> int -> int -> unit

(** Draws a rectangle to the screen *)
val rect: int -> int -> int -> int -> unit

(** Draws a triangle (3-sided polygon) to the screen *)
val triangle: int -> int -> int -> int -> int -> int -> unit
