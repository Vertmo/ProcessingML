(******************************************************************************)
(*                                                                            *)
(*                                  ProcessingML                              *)
(*                                  Basile Pesin                              *)
(*              This project is licensed under the GNU LGPLv3.0               *)
(*                                                                            *)
(******************************************************************************)

type color = {
  r: char;
  g: char;
  b: char;
}

let color_of_rgb r g b =
  try {
    r = char_of_int r;
    g = char_of_int g;
    b = char_of_int b;
  } with Invalid_argument _ -> invalid_arg "color_of_rgb"

let int_of_color c =
  Graphics.rgb (int_of_char c.r)
    (int_of_char c.g)
    (int_of_char c.b)

let red c = int_of_char c.r

let green c = int_of_char c.g

let blue c = int_of_char c.b

type color_state_t = {
  mutable fill: color;
  mutable stroke: color;
  mutable background: color;
}

let color_state = {
  fill = color_of_rgb 0 0 0;
  stroke = color_of_rgb 0 0 0;
  background = color_of_rgb 255 255 255;
}

let fill c = color_state.fill<-c

let current_fill () = color_state.fill

let stroke c = color_state.stroke<-c

let current_stroke () = color_state.stroke

let background c = color_state.background<-c

let current_background () = color_state.background
