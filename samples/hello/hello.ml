(** A first sketch, serving to demonstrate the basis of the language *)

open LibPML

let setup () = Env.size 720 400

let draw () =
  Color.background (Color.color_of_rgb 0 255 255);
  Color.stroke (Color.color_of_rgb 255 0 0);
  Color.fill (Color.color_of_rgb 0 255 0);
  Shape.rect 20 20 100 50;
  Shape.rect 50 30 100 50;
