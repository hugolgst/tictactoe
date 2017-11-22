#!/usr/bin/env bash

echo "Welcome to the tic tac toe game, you can't beat me but you can try."
echo "I am going to ask you some simple questions."
echo "Choose a language (Go/Ruby)"

read Language

if [ $Language == "Go" ]; then
    echo "You choose Go"
    echo `go run Go/main.go`
elif [ $Language == "Ruby" ]; then
    echo "You choose Ruby"
    echo `ruby Ruby/main.rb`
else
    echo "Unknown language"
fi