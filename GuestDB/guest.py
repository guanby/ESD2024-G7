from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import logging

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root:root@localhost:3306/HotelDB'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)


class Guest(db.Model):
    __tablename__ = 'Guest'
    GuestID = db.Column(db.Integer, primary_key=True)

    # kong also has username, password, apikey (to check)
    Username = db.Column(db.String(255), nullable=False)

    # to hash this!!
    Password = db.Column(db.String(255), nullable=False)

    Email = db.Column(db.String(255), nullable=False)
    PhoneNumber = db.Column(db.String(255), nullable=False)

    Fullname = db.Column(db.String(255), nullable=False)
    DOB = db.Column(db.Date, nullable=False)
    AccountCreatedDate = db.Column(db.Date, nullable=False)
    LastLoginDate = db.Column(db.Date, nullable=False)

    # for authentication & identification from kong 
    # users that are not logged in will not have API key
    APIkey = db.Column(db.String(255), nullable=True)


@app.route("/guests")
def get_all_guests():
    guests = Guest.query.all()
    return jsonify(
        [{
            'GuestID': guest.GuestID, 
            'Username': guest.Username, 
            'Email': guest.Email,
            'PhoneNumber': guest.PhoneNumber
        } for guest in guests]
    )

@app.route("/guest/<int:guestID>")
def find_by_guest(guestID):
    # Query the Guest table to find the guest by guestID
    guest = Guest.query.filter_by(GuestID = guestID).first()
    
    if guest:
        # If guest is found, construct a dictionary with the guest information
        guest_info = {
            'GuestID': guest.GuestID,
            'Username': guest.Username,
            'Email': guest.Email,
            'PhoneNumber': guest.PhoneNumber,
            'Fullname': guest.Fullname,

            # Convert to ISO format string
            'DOB': guest.DOB.isoformat(),
            'AccountCreatedDate': guest.AccountCreatedDate.isoformat(),
            'LastLoginDate': guest.LastLoginDate.isoformat(),
            
            'APIkey': guest.APIkey
        }
        # Return the guest information as JSON response
        return jsonify(guest_info)
    else:
        # If guest is not found, return a 404 error
        return jsonify({'error': 'Guest not found'}), 404


if __name__ == '__main__':
    app.run(port=5000, debug=True)
