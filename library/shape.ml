(******************************************************************************)
(*                                                                            *)
(*                                  ProcessingML                              *)
(*                                  Basile Pesin                              *)
(*              This project is licensed under the GNU LGPLv3.0               *)
(*                                                                            *)
(******************************************************************************)

let rect x y w h =
  let y = Env.height () - (y+1) - h in
  Graphics.set_color (Color.int_of_color (Color.current_fill ()));
  Graphics.fill_rect x y w h;
  Graphics.set_color (Color.int_of_color (Color.current_stroke ()));
  Graphics.draw_rect x y w h

let ellipse x y w h =
  let y = Env.height () - (y+1) in
  Graphics.set_color (Color.int_of_color (Color.current_fill ()));
  Graphics.fill_ellipse x y (w/2) (h/2);
  Graphics.set_color (Color.int_of_color (Color.current_stroke ()));
  Graphics.draw_ellipse x y (w/2) (h/2)
