(* Sketch demonstrating drawing of shapes *)

open LibPML
open Color
open Shape

let setup () =
  Env.size 720 400;
  stroke (color_of_rgb 0 0 0);
  fill (color_of_rgb 255 255 255)

let draw () =
  background (color_of_rgb 127 127 127);
  rect 10 20 50 60;
