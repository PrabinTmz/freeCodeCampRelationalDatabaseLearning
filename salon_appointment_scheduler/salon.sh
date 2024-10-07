#! /bin/bash

# Make sure this file has executable permissions by running:
# chmod +x salon.sh

# Function to display services
show_services() {
  echo "Here are the available services:"
  SERVICES=$(psql -U postgres -d salon -t -c "SELECT service_id, name FROM services ORDER BY service_id;")
  echo "$SERVICES" | while read -r SERVICE; do
    echo "$SERVICE" | sed 's/ |/)/'
  done
}

# Function to add or retrieve a customer based on phone number
get_customer() {
  CUSTOMER_PHONE=$1
  CUSTOMER_NAME=$2
  CUSTOMER=$(psql -U postgres -d salon -t -c "SELECT customer_id, name FROM customers WHERE phone='$CUSTOMER_PHONE';")

  if [[ -z "$CUSTOMER" ]]; then
    psql -U postgres -d salon -c "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE');"
    CUSTOMER_ID=$(psql -U postgres -d salon -t -c "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
  else
    CUSTOMER_ID=$(echo $CUSTOMER | awk '{print $1}')
    CUSTOMER_NAME=$(echo $CUSTOMER | awk '{print $2}')
  fi
}

# Start the script logic
while true; do
  show_services
  echo "Please select a service by entering the service number:"
  read SERVICE_ID_SELECTED

  VALID_SERVICE=$(psql -U postgres -d salon -t -c "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
  if [[ -z "$VALID_SERVICE" ]]; then
    echo "Invalid service selection. Please try again."
    continue
  fi

  echo "Enter your phone number:"
  read CUSTOMER_PHONE

  CUSTOMER_EXISTS=$(psql -U postgres -d salon -t -c "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE';")
  
  if [[ -z "$CUSTOMER_EXISTS" ]]; then
    echo "You are a new customer. Please enter your name:"
    read CUSTOMER_NAME
    get_customer "$CUSTOMER_PHONE" "$CUSTOMER_NAME"
  else
    CUSTOMER_NAME=$(psql -U postgres -d salon -t -c "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
  fi

  echo "Please enter your appointment time:"
  read SERVICE_TIME

  CUSTOMER_ID=$(psql -U postgres -d salon -t -c "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
  
  psql -U postgres -d salon -c "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');"

  SERVICE_NAME=$(psql -U postgres -d salon -t -c "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
  
  echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  
  break
done
