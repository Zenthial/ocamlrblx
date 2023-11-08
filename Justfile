run:
    dune build && dune exec ./bin/main.exe

clean:
    rm -rf _build

parse:
    ocamlc -dparsetree test.ml &> parsetree.out && rm test.cm* && rm a.out

test:
    dune runtest