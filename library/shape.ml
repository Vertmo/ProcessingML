(******************************************************************************)
(*                                                                            *)
(*                                  ProcessingML                              *)
(*                                  Basile Pesin                              *)
(*              This project is licensed under the GNU LGPLv3.0               *)
(*                                                                            *)
(******************************************************************************)

open Graphics

let arc x y w h start stop =
  let degree_of_radian (a:float):int = int_of_float (a *. 180. /. Float.pi) in
  let y = Env.height () - (y+1) in
  set_color (Color.int_of_color (Color.current_fill ()));
  fill_arc x y (w/2) (h/2) (degree_of_radian (-.start)) (degree_of_radian (-.stop));
  set_color (Color.int_of_color (Color.current_stroke ()));
  draw_arc x y (w/2) (h/2) (degree_of_radian (-.start)) (degree_of_radian (-.stop))

let ellipse x y w h =
  let y = Env.height () - (y+1) in
  set_color (Color.int_of_color (Color.current_fill ()));
  fill_ellipse x y (w/2) (h/2);
  set_color (Color.int_of_color (Color.current_stroke ()));
  draw_ellipse x y (w/2) (h/2)

let line x1 y1 x2 y2 =
  let y1 = Env.height () - (y1+1) and y2 = Env.height () - (y2+1) in
  set_color (Color.int_of_color (Color.current_stroke ()));
  draw_segments [|(x1,y1,x2,y2)|]

let point x y =
  let y = Env.height () - (y+1) in
  set_color (Color.int_of_color (Color.current_stroke ()));
  plot x y

let quad x1 y1 x2 y2 x3 y3 x4 y4 =
  let y1 = Env.height () - (y1+1) and y2 = Env.height () - (y2+1)
  and y3 = Env.height () - (y3+1) and y4 = Env.height () - (y4+1) in
  let coords = [|(x1,y1);(x2,y2);(x3,y3);(x4,y4)|] in
  set_color (Color.int_of_color (Color.current_fill ()));
  fill_poly coords;
  set_color (Color.int_of_color (Color.current_stroke ()));
  draw_poly coords

let rect x y w h =
  let y = Env.height () - (y+1) - h in
  set_color (Color.int_of_color (Color.current_fill ()));
  fill_rect x y w h;
  set_color (Color.int_of_color (Color.current_stroke ()));
  draw_rect x y w h

let triangle x1 y1 x2 y2 x3 y3 =
  let y1 = Env.height () - (y1+1) and y2 = Env.height () - (y2+1)
  and y3 = Env.height () - (y3+1) in
  let coords = [|(x1,y1);(x2,y2);(x3,y3)|] in
  set_color (Color.int_of_color (Color.current_fill ()));
  fill_poly coords;
  set_color (Color.int_of_color (Color.current_stroke ()));
  draw_poly coords
