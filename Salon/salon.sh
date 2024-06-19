#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then 
    echo $1
  fi
  echo -e "\nWelcome to My Salon, how can I help you?"
  echo -e "\n1) Haircut\n2) Hair dye\n3) Styling\n"
  read SERVICE_ID_SELECTED
  # check input
  if [[ ! $SERVICE_ID_SELECTED =~ ^[1-3] ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    # get phone number
    echo -e "\nwhat's your phone number?"
    read CUSTOMER_PHONE
    # if not in database
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]
    then
      # get name 
      echo -e "\nWhat's your name?"
      read CUSTOMER_NAME
      # add customer
      ADD_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi
    # get time of the appointment
    echo -e "\nWhat time would you like?"
    read SERVICE_TIME
    # add new appointment
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_ID ]]
    then
      echo Error
    else
      ADD_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED)")
      SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
      echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  fi
}

MAIN_MENU