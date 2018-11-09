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
  (match (Color.current_fill ()) with
   | Some c ->
       set_color (Color.int_of_color c);
       fill_arc x y (w/2) (h/2) (degree_of_radian (-.start)) (degree_of_radian (-.stop))
   | None -> ());
  (match (Color.current_stroke ()) with
   | Some c ->
     set_color (Color.int_of_color c);
     draw_arc x y (w/2) (h/2) (degree_of_radian (-.start)) (degree_of_radian (-.stop))
   | None -> ())

let ellipse x y w h =
  let y = Env.height () - (y+1) in
  (match (Color.current_fill ()) with
   | Some c -> set_color (Color.int_of_color c);
     fill_ellipse x y (w/2) (h/2);
   | None -> ());
  (match (Color.current_stroke ()) with
   | Some c ->
     set_color (Color.int_of_color c);
     draw_ellipse x y (w/2) (h/2)
   | None -> ())

let line x1 y1 x2 y2 =
  let y1 = Env.height () - (y1+1) and y2 = Env.height () - (y2+1) in
  match (Color.current_stroke ()) with
  | Some c ->
    set_color (Color.int_of_color c);
    draw_segments [|(x1,y1,x2,y2)|]
  | None -> ()

let point x y =
  let y = Env.height () - (y+1) in
  match (Color.current_stroke ()) with
  | Some c ->
    set_color (Color.int_of_color c);
    plot x y
  | None -> ()

let quad x1 y1 x2 y2 x3 y3 x4 y4 =
  let y1 = Env.height () - (y1+1) and y2 = Env.height () - (y2+1)
  and y3 = Env.height () - (y3+1) and y4 = Env.height () - (y4+1) in
  let coords = [|(x1,y1);(x2,y2);(x3,y3);(x4,y4)|] in
  (match (Color.current_fill ()) with
   | Some c -> set_color (Color.int_of_color c);
     fill_poly coords
   | None -> ());
  (match (Color.current_stroke ()) with
   | Some c ->
     set_color (Color.int_of_color c);
     draw_poly coords
   | None -> ())

let rect x y w h =
  let y = Env.height () - (y+1) - h in
  (match (Color.current_fill ()) with
   | Some c -> set_color (Color.int_of_color c);
     fill_rect x y w h;
   | None -> ());
  (match (Color.current_stroke ()) with
   | Some c ->
     set_color (Color.int_of_color c);
     draw_rect x y w h
   | None -> ())

let triangle x1 y1 x2 y2 x3 y3 =
  let y1 = Env.height () - (y1+1) and y2 = Env.height () - (y2+1)
  and y3 = Env.height () - (y3+1) in
  let coords = [|(x1,y1);(x2,y2);(x3,y3)|] in
  (match (Color.current_fill ()) with
   | Some c -> set_color (Color.int_of_color c);
     fill_poly coords
   | None -> ());
  (match (Color.current_stroke ()) with
   | Some c ->
     set_color (Color.int_of_color c);
     draw_poly coords
   | None -> ())
