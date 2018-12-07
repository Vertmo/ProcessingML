(* Content of a sample sketch file.
   This file will be copied in every generated sketch, with some added imports *)

let _ = let rstart = ref (setup ()) in
  Graphics.auto_synchronize false;
  let mt = Mutex.create () in
  let rec handle_event rs =
    let evstat = Graphics.wait_next_event [Graphics.Button_down; Graphics.Key_pressed] in
    (if evstat.keypressed then (Mutex.lock mt; rs := key_pressed !rs evstat.key; Mutex.unlock mt)
     else (Mutex.lock mt; rs := mouse_clicked !rs; Mutex.unlock mt);
     handle_event rs) in
  ignore (Thread.create handle_event rstart);
  let rec draw_rec rs =
    Unix.sleepf (1./.60.);
    Mutex.lock mt;
    rs := draw !rs; Graphics.synchronize ();
    Mutex.unlock mt; draw_rec rs in
  draw_rec rstart
