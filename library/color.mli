(******************************************************************************)
(*                                                                            *)
(*                                  ProcessingML                              *)
(*                                  Basile Pesin                              *)
(*              This project is licensed under the GNU LGPLv3.0               *)
(*                                                                            *)
(******************************************************************************)

(** Color handling *)

(** Color type *)
type color

(** Creates a color from it's RGB values
    [r], [g] and [b] should be between 0 and 255 *)
val color_of_rgb: int -> int -> int -> color

(** Gets an integer representing the internal Graphics color from a color *)
val int_of_color: color -> int

(** Extracts the red value from a color *)
val red: color -> int

(** Extracts the green value from a color *)
val green: color -> int

(** Extracts the blue value from a color *)
val blue: color -> int

(** Sets the color used to fill shapes *)
val fill: color -> unit

(** Disables filling geometry *)
val no_fill: unit -> unit

(** Gets the color used to fill shapes *)
val current_fill: unit -> color option

(** Sets the color used to draw lines and borders around shapes *)
val stroke: color -> unit

(** Disables stroking outlines *)
val no_stroke: unit -> unit

(** Gets the color used to draw lines and borders around shapes *)
val current_stroke: unit -> color option

(** Draws a background of the given color *)
val background: color -> unit
