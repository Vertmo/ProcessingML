(******************************************************************************)
(*                                                                            *)
(*                                  ProcessingML                              *)
(*                                  Basile Pesin                              *)
(*              This project is licensed under the GNU LGPLv3.0               *)
(*                                                                            *)
(******************************************************************************)

let ellipse x y w h =
  let y = Env.height () - (y+1) in
  Graphics.set_color (Color.int_of_color (Color.current_fill ()));
  Graphics.fill_ellipse x y (w/2) (h/2);
  Graphics.set_color (Color.int_of_color (Color.current_stroke ()));
  Graphics.draw_ellipse x y (w/2) (h/2)

let line x1 y1 x2 y2 =
  let y1 = Env.height () - (y1+1) and y2 = Env.height () - (y2+1) in
  Graphics.set_color (Color.int_of_color (Color.current_stroke ()));
  Graphics.draw_segments [|(x1,y1,x2,y2)|]

let quad x1 y1 x2 y2 x3 y3 x4 y4 =
  let y1 = Env.height () - (y1+1) and y2 = Env.height () - (y2+1)
  and y3 = Env.height () - (y3+1) and y4 = Env.height () - (y4+1) in
  let coords = [|(x1,y1);(x2,y2);(x3,y3);(x4,y4)|] in
  Graphics.set_color (Color.int_of_color (Color.current_fill ()));
  Graphics.fill_poly coords;
  Graphics.set_color (Color.int_of_color (Color.current_stroke ()));
  Graphics.draw_poly coords

let rect x y w h =
  let y = Env.height () - (y+1) - h in
  Graphics.set_color (Color.int_of_color (Color.current_fill ()));
  Graphics.fill_rect x y w h;
  Graphics.set_color (Color.int_of_color (Color.current_stroke ()));
  Graphics.draw_rect x y w h

let triangle x1 y1 x2 y2 x3 y3 =
  let y1 = Env.height () - (y1+1) and y2 = Env.height () - (y2+1)
  and y3 = Env.height () - (y3+1) in
  let coords = [|(x1,y1);(x2,y2);(x3,y3)|] in
  Graphics.set_color (Color.int_of_color (Color.current_fill ()));
  Graphics.fill_poly coords;
  Graphics.set_color (Color.int_of_color (Color.current_stroke ()));
  Graphics.draw_poly coords
