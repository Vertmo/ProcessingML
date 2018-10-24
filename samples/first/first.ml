(** A first sketch, serving only to demonstrate module loading by the app *)

open LibPML

let setup () = print_endline "setup"; 0

let draw i = print_int i; Test.hello (); (i+1)
