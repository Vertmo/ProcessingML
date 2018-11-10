(******************************************************************************)
(*                                                                            *)
(*                                  ProcessingML                              *)
(*                                  Basile Pesin                              *)
(*              This project is licensed under the GNU LGPLv3.0               *)
(*                                                                            *)
(******************************************************************************)

(** Drawing shapes *)

(** Draws an arc to the screen
    @param x x-coordinate of the center of the arc's ellipse
    @param y y-coordinate of the center of the arc's ellipse
    @param w horizontal diameter (width) of the arc's ellipse
    @param h vertical diameter (height) of the arc's ellipse
    @param start angle to start the arc, specified in radians
    @param stop angle to stop the arc, specified in radians
    @return unit
*)
val arc: int -> int -> int -> int -> float -> float -> unit

(** Draws an ellipse to the screen
    @param x x-coordinate of the center of the ellipse
    @param y y-coordinate of the center of the ellipse
    @param w horizontal diameter (width) of the ellipse
    @param h vertical diameter (height) of the ellipse
    @return unit
*)
val ellipse: int -> int -> int -> int -> unit

(** Draws a line to the screen
    @param x1 x-coordinate of the first point
    @param y1 y-coordinate of the first point
    @param x2 x-coordinate of the second point
    @param y2 y-coordinate of the second point
    @return unit
*)
val line: int -> int -> int -> int -> unit

(** Draws a point to the screen
    @param x x-coordinate of the point
    @param y y-coordinate of the point
    @return unit
*)
val point: int -> int -> unit

(** Draws a quadrilateral (4-sided polygon) to the screen
    @param x1 x-coordinate of the first point
    @param y1 y-coordinate of the first point
    @param x2 x-coordinate of the second point
    @param y2 y-coordinate of the second point
    @param x3 x-coordinate of the third point
    @param y3 y-coordinate of the third point
    @param x4 x-coordinate of the third point
    @param y4 y-coordinate of the third point
    @return unit
*)
val quad: int -> int -> int -> int
  -> int -> int -> int -> int -> unit

(** Draws a rectangle to the screen
    @param x x-coordinate of the upper-left corner
    @param y y-coordinate of the upper-left corner
    @param w width of the rectangle
    @param h height of the rectangle
    @return unit
*)
val rect: int -> int -> int -> int -> unit

(** Draws a triangle (3-sided polygon) to the screen
    @param x1 x-coordinate of the first point
    @param y1 y-coordinate of the first point
    @param x2 x-coordinate of the second point
    @param y2 y-coordinate of the second point
    @param x3 x-coordinate of the third point
    @param y3 y-coordinate of the third point
    @return unit
*)
val triangle: int -> int -> int -> int -> int -> int -> unit
