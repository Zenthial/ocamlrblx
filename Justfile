run:
    dune build && dune exec ./bin/main.exe

clean:
    rm -rf _build

parse:
    #!/usr/bin/env bash

    ocamlc -dparsetree test.ml &> parsetree.out
    rm test.cm*
    rm a.out
    just -f {{justfile()}} print

print:
    bat parsetree.out

test:
    dune runtest
