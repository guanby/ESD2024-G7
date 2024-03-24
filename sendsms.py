from flask import Flask, request, jsonify
import requests
from twilio.rest import Client


account_sid = 'ACbc1e7d315e924fe925a13b2c25e07e1c'
auth_token  = '89b11d38ee3367e7d1c0a60ec1a14611'

client = Client(account_sid, auth_token)
info = request.json.get('phone')
# customer_id = request.json.get('customer_id', None)

if (info == 'Booking confirmed'):
    message = client.messages.create(
        to='+6593484666',
        from_='+12248585061',
        body="Booking confirmed! Confirmation email will be sent to your email")

    print(message.sid)
if (info == 'Price drop'):
    message = client.messages.create(
        to='+6593484666',
        from_='+12248585061',
        body="Price drop! Hurry book!")

    print(message.sid)    


message = client.messages.create(
    to='+6593484666',
    from_='+12248585061',
    body="Booking confirmed! Confirmation email will be sent to your email")

print(message.sid)