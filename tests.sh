#!/bin/bash

red="\033[0;31m"
green="\033[0;32m"

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

if [ $? == 0 ]; then
  echo -e "${green} All tests passed."
else
  echo -e "${red} Some tests failed."
fi
