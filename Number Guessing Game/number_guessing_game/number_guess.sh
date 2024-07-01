#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# check username before the game start
echo "Enter your username:"
read USERNAME
USER_INFO=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")
# if user not in database
if [[ -z $USER_INFO ]]
then
    # insert into database
    NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # if user in database
  echo $USER_INFO | while IFS='|' read USER_ID USER GAMES BEST
  do
    echo "Welcome back, $USER! You have played $GAMES games, and your best game took $BEST guesses."
  done
fi

GAME() {
  read USER_GUESS
  # check if input is an integer
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    # if input is not an integer
    echo "That is not an integer, guess again:"
    GAME
  else
    # if input is an integer
    if [[ $USER_GUESS -gt $RANDOM_NUMBER ]]
    then
      # increase counter and try again
      echo -e "It's lower than that, guess again:\n"
      COUNTER=$(( COUNTER + 1 ))
      GAME
    elif [[ $USER_GUESS -lt $RANDOM_NUMBER ]]
    then
      # increase counter and try again
      echo -e "It's higher than that, guess again:\n"
      COUNTER=$(( COUNTER + 1 ))
      GAME
    else
      # increase counter by 1 because it's starts at 0
      COUNTER=$(( COUNTER + 1 ))
      # increase times played
      GET_GAMES=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
      INCREASE_GAMES=$(( $GET_GAMES + 1 ))
      # get best game
      BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
      # if fist time playing
      if [[ -z $BEST_GAME ]]
      then
        UPDATE=$($PSQL "UPDATE users SET games_played=$INCREASE_GAMES, best_game=$COUNTER WHERE username='$USERNAME'")
      else
        # update database
        if [[ $COUNTER -lt $BEST_GAME ]]
        then
          UPDATE=$($PSQL "UPDATE users SET games_played=$INCREASE_GAMES, best_game=$COUNTER WHERE username='$USERNAME'")
        else
          UPDATE=$($PSQL "UPDATE users SET games_played=$INCREASE_GAMES WHERE username='$USERNAME'")
        fi
      fi
    fi
  fi
}

# start the game
echo -e "\nGuess the secret number between 1 and 1000:\n"
# generate a number between 1 and 1000
RANDOM_NUMBER=$(( 1 + RANDOM % 1000 ))
GAME
echo -e "\nYou guessed it in $COUNTER tries. The secret number was $RANDOM_NUMBER. Nice job!"
