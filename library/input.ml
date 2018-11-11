(******************************************************************************)
(*                                                                            *)
(*                                  ProcessingML                              *)
(*                                  Basile Pesin                              *)
(*              This project is licensed under the GNU LGPLv3.0               *)
(*                                                                            *)
(******************************************************************************)

let mouse_x () = fst (Graphics.mouse_pos ())

let mouse_y () = Env.height () - (snd (Graphics.mouse_pos ())+1)
