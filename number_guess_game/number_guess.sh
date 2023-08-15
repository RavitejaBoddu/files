#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"
RANDOM_NUMBER=$(( RANDOM % 1000 ))
NUMBER_OF_GUESSES=0

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\nEnter your username:"
  read USERNAME

  if [[ ${#USERNAME} -le 22 ]]
  then
    USER=$($PSQL "SELECT * FROM number_guess WHERE username = '$USERNAME'")
    if [[ -n $USER ]]
    then
      echo "$USER" | while read GAME_ID BAR USERNAME BAR GAMES_PLAYED BAR BEST_GAME
      do
        echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
      done
    else
      echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
      USER=$($PSQL "INSERT INTO number_guess(username,games_played,best_game) VALUES('$USERNAME',0,0);")
    fi
    echo -e "\nGuess the secret number between 1 and 1000:"
    read USER_GUESS
    NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
    if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
    then
      echo -e "\nThat is not an integer, guess again:"
      read USER_GUESS
      NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
      GUESS_GAME $USER_GUESS
    else
      GUESS_GAME $USER_GUESS
    fi
  else
    MAIN_MENU "Only 22 characters are allowed for unsername."
  fi
}

GUESS_GAME(){
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    if [[ $1 -eq $RANDOM_NUMBER ]]
    then 
      USER=$($PSQL "SELECT * FROM number_guess WHERE username = '$USERNAME';")
      echo "$USER" | while read GAME_ID BAR USERNAME BAR GAMES_PLAYED BAR BEST_GAME
      do
        TOTAL_GAMES=$(( GAMES_PLAYED + 1 ))
        UPDATE_GAMES_PLAYED=$($PSQL "UPDATE number_guess SET games_played=$TOTAL_GAMES WHERE username = '$USERNAME';")
        if (( $NUMBER_OF_GUESSES <  $BEST_GAME || $BEST_GAME ==  0 ))
        then
          UPDATE_BEST_GAME=$($PSQL "UPDATE number_guess SET best_game=$NUMBER_OF_GUESSES WHERE username = '$USERNAME';")
        fi
        echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
      done
    elif [[ $1 -lt $RANDOM_NUMBER ]]
    then
      echo -e "\nIt's higher than that, guess again:"
      read USER_GUESS
      NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
      GUESS_GAME $USER_GUESS
    elif [[ $1 -gt $RANDOM_NUMBER ]]
    then
      echo -e "\nIt's lower than that, guess again:"
      read USER_GUESS
      NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
      GUESS_GAME $USER_GUESS
    else
      echo "Something went wrong!"
    fi
  else
    echo -e "\nThat is not an integer, guess again:"
    read USER_GUESS
    NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
    GUESS_GAME $USER_GUESS
  fi
}

MAIN_MENU
