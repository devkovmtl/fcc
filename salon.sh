#! /bin/bash

# #psql command to log in and interact with the database.
PSQL="psql -X --username=postgres --dbname=salon --tuples-only -c"



echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
    if [[ $1 ]]
        then 
            echo -e "\n$1"
    fi
    
    SERVICES=$($PSQL"SELECT service_id, name FROM services ORDER BY service_id")

    if [[ -z $SERVICES ]]
        then
            MAIN_MENU "\nSorry, we don't have any services available right now."
        else 
            echo "$SERVICES" | while read SERVICE_ID BAR NAME
            do
                echo -e "$SERVICE_ID) $NAME"
            done
            echo -e "\nWhich service would you like?"
            read SERVICE_ID_SELECTED
            if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
                then 
                    MAIN_MENU "That is not a valid service number."
                else
                    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
                    
                    if [[ -z $SERVICE_NAME ]]
                        then
                            MAIN_MENU "That is not a valid service number."
                        else
                            # get customer info
                            echo -e "\nWhat is your phone number?"
                            read CUSTOMER_PHONE

                            CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

                            if [[ -z $CUSTOMER_NAME ]]
                                then 
                                    # get new customer
                                    echo -e "\nWhat's your name?"
                                    read CUSTOMER_NAME
                                    # insert new customer
                                    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
                            fi
                            # get customer_id
                            CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

                            echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
                            read SERVICE_TIME
                            APPOINTMENT=$($PSQL"INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

                            echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
                    fi
            fi
    fi
}

MAIN_MENU