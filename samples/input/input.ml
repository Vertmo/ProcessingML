open LibPML
open Color

let setup () = Env.size 720 400; []

let draw l =
  background (color_of_rgb 255 255 255);
  no_stroke ();
  List.iter (fun e ->
      Color.fill (snd e);
      Shape.ellipse (fst (fst e)) (snd (fst e)) 60 60) l;
  fill (color_of_rgb 0 0 0);
  Shape.ellipse (Input.mouse_x ()) (Input.mouse_y ()) 20 20;
  l

let mouse_clicked l =
  ((Input.mouse_x (), Input.mouse_y ()), color_of_rgb 0 255 0)::l
