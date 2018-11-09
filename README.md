# ProcessingML
An OCaml implementation of the Processing library

## Dependencies
This project currently only works for Unix-like systems (Linux or MacOS), since it is heavily reliant on the `Unix` OCaml module.

In order to build sketches, and to build this project, you'll need to have OCaml (>= 4.07.0) and [opam](https://opam.ocaml.org/) installed, as well as [dune](https://github.com/ocaml/dune), which you can install through `opam install dune`.

## Usage
* Install the the app and library in your current opam switch with `opam install .`
* Execute the app on a sketch with `processingml sketch/sketch.ml`

## License
This project is licensed under the GNU LGPLv3.0. See [LICENSE](LICENSE).
