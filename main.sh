#!/bin/bash

mkdir -p ./tests/tmp

assembler_file=main.lua
assembler() {
  result=$(lua "$assembler_file" $1)
}

search_dir=./tests/asm
for entry in "$search_dir"/*
do
  assembler "${entry%.*}"
  mv "${entry%.*}.hack" "./tests/tmp"
done

diff "./tests/hack" "./tests/tmp"
