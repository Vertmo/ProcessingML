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
  rect 60 120 50 60;
  ellipse 300 100 160 100;
  line 30 20 85 20;
  stroke (color_of_rgb 255 255 255);
  line 85 20 85 75;
  stroke (color_of_rgb 0 0 0);
  quad 338 331 386 320 369 363 330 376;
  triangle 430 175 458 120 486 175;
  point 360 200; (* Somewhat at the center *)

  arc 500 250 50 50 0. (Float.pi/.2.);
  arc 500 250 60 60 (Float.pi/.2.) Float.pi;
  arc 500 250 70 70 Float.pi (Float.pi*.5./.4.);
  arc 500 250 80 80 (Float.pi*.5./.4.) (Float.pi*.2.)
