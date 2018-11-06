(** A first sketch, serving to demonstrate the basis of the language *)

open LibPML

let setup () = Env.size 720 400;
  Color.stroke (Color.color_of_rgb 255 0 0);
  Color.fill (Color.color_of_rgb 0 255 0);
  20

let draw x =
  Color.background (Color.color_of_rgb 0 255 255);
  Shape.rect x 20 100 50;
  Shape.rect (x+30) 30 100 50;
  (x + 5) mod Env.width ()
