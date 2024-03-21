#complex microservice 1

#functions import
from flask import Flask, request, jsonify
from flask_cors import CORS

import os, sys

import requests
from invokes import invoke_http

#import pika
import json
#import amqp_connection

# main code
app = Flask(__name__)
CORS(app)

#define simple microservices as URL here
room_URL = "http://localhost:5000" # or call by "hotel.py" once custom network up
guest_URL = "http://localhost:5001" # or call by "guest.py" once custom network up
payment_URL = "payment.py"
transaction_URL = "http://localhost:5002" # or call by "transaction.py" once custom network up
notification_URL = "notification.py"


### AMQP start ###
# Instead of hardcoding the values, we can also get them from the environ as shown below
# exchangename = environ.get('exchangename') #order_topic
# exchangetype = environ.get('exchangetype') #topic 

#create a connection and a channel to the broker to publish messages to activity_log, error queues
#connection = amqp_connection.create_connection() 
#channel = connection.channel()

#if the exchange is not yet created, exit the program
#if not amqp_connection.check_exchange(channel, exchangename, exchangetype):
    #print("\nCreate the 'Exchange' before running this microservice. \nExiting the program.")
    #sys.exit(0)  # Exit with a success status
### AMQP END ###


@app.route("/book", methods=['POST'])
def book():
    # Simple check of input format and data of the request are JSON
    if request.is_json:
        try:
            booking_info = request.get_json() ### the information guest input and where we need to process
            ### room id, dates, apikey
            print("\nReceived an order in JSON:", booking_info)

            # do the actual work
            # 1. Send order info {cart items}
            result = processbooking(booking_info)
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
                "message": "book.py internal error: " + ex_str
            }), 500

    # if reached here, not a JSON request.
    return jsonify({
        "code": 400,
        "message": "Invalid JSON input: " + str(request.get_data())
    }), 400


def processbooking(booking_info):


    ## pull out roomid and dates?
    json_string = json.loads(booking_info)
    roomid = json_string['roomid']
    date = json_string['date']


   
    # 2. Send the booking info {roomID , Booking Date, apikey}
    # Invoke the hotel microservice

    print('\n-----Invoking room microservice-----')
    room_result = invoke_http(room_URL, method='POST', json=booking_info)
    print('order_result:', room_result)
  

    # Check the order result
    code = room_result["code"]

 
    if code not in range(200, 300):
        
        # if a failure trigger error handler
        error(["Booking Room"])
    else:

        # 3. Retrieve guest info from guest.py
        # Invoke the guest microservice
        print('\n\n-----Invoking guest microservice-----')    
        guest_result = invoke_http(
            guest_URL, method="GET", json=booking_info['apikey'])  # thinking of using api key to identify guest
        print("guest_result:", guest_result, '\n')  #id, name, email, phone

        # Check the guest result;
        code = guest_result["code"]

        if code not in range(200, 300):

            # if a failure trigger error handler
            error(["Retrieving Guest Details",roomid,date])
        else:
            # 4. Proceed to making payment 
            # Invoke the payment microservice
            ### is there a redirection to payment page?
            
            payment_result = invoke_http(
            payment_URL, method="POST", json=booking_info)  #!!! this part needs to refine depending on how payment is invoke
            print("payment_result:", payment_result, '\n') 

            ### error with payment
            code = payment_result["code"]
            if code not in range(200, 300):

            # if a failure trigger error handler
                error(["Making Payment",roomid,date])
            else:
                # 4. Proceed to sending confirmation 
                # Invoke the notification microservice
                nofication_result = invoke_http(
                notification_URL, method="POST", json=guest_result)


def error(message):
    # goal is to handle error 1.revert room count & 2.return a json string to inform guest


    #assume that if booking room service fail, the room count wont decrease so no need adjust count
    if len(message) == 1:

        return {
                "code": 400,
                "message": "There's an error when" + message[0] + ", please try again"
            }
    else:
        # increase room count - to do that we need to know the room id and date of booking
        room_id = message[1]
        date = message[2]
        invoke_http(room_URL, method='PUT', json=[room_id,date])

        
        return {
                "code": 400,
                "message": "There's an error when" + message[0] + ", please try again"
            }


# Execute this program if it is run as a main script (not by 'import')
if __name__ == "__main__":
    print("This is flask " + os.path.basename(__file__) + " for booking hotel room...")
    app.run(host="0.0.0.0", port=5100, debug=True)
