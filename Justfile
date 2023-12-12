run:
    dune build && dune exec ./bin/main.exe

clean:
    rm -rf _build

parse:
    #!/usr/bin/env bash

    pushd {{justfile_directory()}}/transpile >/dev/null
    for f in *; do
        if [ "$f" == "dune" ]; then continue; fi
        name=${f%.*}
        ocamlc -dparsetree "$f" &> {{justfile_directory()}}/parsetree/"$name".parse
    done

    rm *.cm*
    rm a.out
    
    popd >/dev/null

test:
    dune runtest
