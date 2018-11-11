open LibPML
open Color

let setup () = Env.size 720 400

let draw () =
  background (color_of_rgb 255 255 255);
  Shape.ellipse (Input.mouse_x ()) (Input.mouse_y ()) 50 50
