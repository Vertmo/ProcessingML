(******************************************************************************)
(*                                                                            *)
(*                                  ProcessingML                              *)
(*                                  Basile Pesin                              *)
(*              This project is licensed under the GNU LGPLv3.0               *)
(*                                                                            *)
(******************************************************************************)

(** Mouse and Keyboard input *)

(** Horizontal position of the mouse *)
val mouse_x: unit -> int

(** Vertical position of the mouse *)
val mouse_y: unit -> int

(** This function is called once every time the mouse is clicked *)
val mouse_clicked: 'a -> 'a

(** This function is called once every time the mouse is moved *)
val mouse_moved: 'a -> 'a

(** This function is called once every time a key is pressed *)
val key_pressed: 'a -> char -> 'a
