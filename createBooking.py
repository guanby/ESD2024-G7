#complex microservice 1 - booking hotel rooms

#functions import
from flask import Flask, request, jsonify
from flask_cors import CORS

import os, sys

import requests
from invokes import invoke_http

import pika
import json
import amqp_connection
from os import environ

app = Flask(__name__)
CORS(app)

#define simple microservices as URL here - Adjust to how u run depending on presence of custom network
room_URL = "hotel.py"
guest_URL = "guest.py"
payment_URL = "payment.py"
transaction_URL = "transaction.py"
notification_URL = "notification.py"


### AMQP ###
exchangename = environ.get('exchangename') # transaction
exchangetype = environ.get('exchangetype') # topic exchange

#create a connection and a channel to the broker to publish messages to transaction
connection = amqp_connection.create_connection() 
channel = connection.channel()

if not amqp_connection.check_exchange(channel, exchangename, exchangetype):
    print("\nCreate the 'Exchange' before running this microservice. \nExiting the program.")
    sys.exit(0)  # Exit with a success status


# main code

@app.route("/book", methods=['POST'])
def createBooking():
    # Simple check of input format and data of the request are JSON
    if request.is_json:
        try:
            booking_info = request.get_json() # guest input: {'roomid','date','apikey'}
            # apikey is use here as a unique identification -> match with the apikey that we will store
            # within guest database

            print("\nReceived an order in JSON:", booking_info)

            # 1. function "processBooking" to process guest inputs for booking
            result = processBooking(booking_info)
            print('\n------------------------')
            print('\nresult: ', result)
            return jsonify(result), result["code"]

        except Exception as e:
            # Unexpected error in code
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            ex_str = str(e) + " at " + str(exc_type) + ": " + fname + ": line " + str(exc_tb.tb_lineno)
            print(ex_str)

            return jsonify({
                "code": 500,
                "message": "createBooking.py internal error: " + ex_str
            }), 500

    # if reached here, not a JSON request.
    return jsonify({
        "code": 400,
        "message": "Invalid JSON input: " + str(request.get_data())
    }), 400


# rooma, [1,2,3]
def processBooking(booking_info):

    # 2. Send the booking info {roomID , Booking Date [], apikey}
    # Invoke the hotel microservice

    print('\n-----Invoking rooms microservice-----')
    room_result = invoke_http(room_URL, method='POST', json=booking_info)
    print('order_result:', room_result)
  
    # Check the room result
    code = room_result["code"]

    # if a failure trigger error handler
    if code not in range(200, 300):
        
        errorHandle(booking_info)
        returnMessage(["There's an error when booking your room, please try again",400])

    # room is not available for the dates
    elif room_result['success'] != True:

        returnMessage([room_result['message'],409])

    else: # room booking is successful

        # 3. Retrieve guest info from guest.py
        # Invoke the guest microservice
        print('\n\n-----Invoking guest microservice-----')    
        guest_result = invoke_http(
            guest_URL, method="GET", json=booking_info)  # use api key to identify guest
        print("guest_result:", guest_result, '\n')  # {id, name, email, phone}

        # Check the guest result;
        code = guest_result["code"]

        # if a failure trigger error handler
        if code not in range(200, 300):
            errorHandle(booking_info)
            returnMessage(["There's an error when retrieving your details, please try again",400])

        else: # guest details retrieval successful
            # 4. Proceed to making payment 
            # Invoke the payment microservice
            
            payment_result = invoke_http(
            payment_URL, method="POST", json=booking_info)  
            print("payment_result:", payment_result, '\n') 

            ### error with payment
            # if a failure trigger error handler
            code = payment_result["code"]
            if code not in range(200, 300):
                errorHandle(booking_info)
                returnMessage(["There's an error making payment, please try again",400])

            else:
                # 4. Proceed to sending confirmation 
                # Invoke the notification microservice
                invoke_http(notification_URL, method="POST", json=guest_result) # {guest details?}

                # 5. Asyn communication with transaction microservice to store transaction details
                
                channel.basic_publish(exchange=exchangename, routing_key="transaction", 
                body=guest_result, properties=pika.BasicProperties(delivery_mode = 2)) 

                returnMessage(['',200])

def errorHandle(booking_info):
    # increase room count - to do that we need to know the room id and date of booking
    invoke_http(room_URL, method='PUT', json=booking_info) 
    
def returnMessage(message):  # [message,code]
    # results to return to guest
    if message[0] == '':
        return {
                "code": message[1],
                "message": "Booking successful"
            }
    else:

        return {
                    "code": message[1],
                    "message": message[0]
                }


# Execute this program if it is run as a main script (not by 'import')
if __name__ == "__main__":
    print("This is flask " + os.path.basename(__file__) + " for booking hotel room...")
    app.run(host="0.0.0.0", port=5100, debug=True)

