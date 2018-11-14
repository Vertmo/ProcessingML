open LibPML
open Color

let setup () = Env.size 720 400; ((color_of_rgb 0 255 0), [])

let draw (bc, l) =
  background (color_of_rgb 255 255 255);
  no_stroke ();
  List.iter (fun e ->
      fill (snd e);
      Shape.ellipse (fst (fst e)) (snd (fst e)) 60 60) l;
  fill bc;
  Shape.ellipse (Input.mouse_x ()) (Input.mouse_y ()) 20 20;
  (bc, l)

let mouse_clicked (bc, l) =
  (bc, l@[((Input.mouse_x (), Input.mouse_y ()), bc)])

let key_pressed (bc, l) k = match k with
  | 'r' -> (color_of_rgb 255 0 0, l)
  | 'g' -> (color_of_rgb 0 255 0, l)
  | 'b' -> (color_of_rgb 0 0 255, l)
  | _ -> (bc, l)
