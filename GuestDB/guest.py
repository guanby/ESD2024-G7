from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
# import logging

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root:@localhost:3306/GuestDB'
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
def find_by_guest_id(guestID):
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
    

@app.route("/guest", methods=['POST'])
def create_guest():
    guest_id = request.json.get('guest_id', None)
    new_guest = Guest(GuestID = guest_id, AccountCreatedDate = datetime.now())

    try:
        db.session.add(new_guest)
        db.session.commit()

    except Exception as e:
        return jsonify(
            {
                "code": 500,
                "message": "An error occurred while creating the order. " + str(e)
            }
        ), 500

    return jsonify(
        {
            "code": 201,
            "data": new_guest.json()
        }
    ), 201


# can update more than 1 field at a time
@app.route("/guest/<int:guest_id>", methods=["PATCH"])
def update_guest(guest_id):
    # Assuming the request contains the necessary data for partially updating the guest
    
    guest = Guest.query.get(guest_id)
    
    if guest:
        updated_fields = []  # List to store updated fields
        
        # Update the guest information based on the received data
        if 'Username' in request.json:
            guest.Username = request.json['Username']
            updated_fields.append('Username')
        if 'Password' in request.json:
            guest.Password = request.json['Password']
            updated_fields.append('Password')
        if 'Email' in request.json:
            guest.Email = request.json['Email']
            updated_fields.append('Email')
        if 'PhoneNumber' in request.json:
            guest.PhoneNumber = request.json['PhoneNumber']
            updated_fields.append('PhoneNumber')
        if 'Fullname' in request.json:
            guest.Fullname = request.json['Fullname']
            updated_fields.append('Fullname')
        if 'DOB' in request.json:
            guest.DOB = request.json['DOB']
            updated_fields.append('DOB')
        if 'LastLoginDate' in request.json:
            guest.LastLoginDate = request.json['LastLoginDate']
            updated_fields.append('LastLoginDate')
        if 'APIkey' in request.json:
            guest.APIkey = request.json['APIkey']
            updated_fields.append('APIkey')
        
        # Commit the changes to the database
        db.session.commit()
        
        response_message = {
            'message': 'Guest information updated successfully',
            'guest_id': guest_id,
            'updated_fields': updated_fields
        }
        
        return jsonify(response_message), 200
    else:
        return jsonify({'error': 'Guest not found'}), 404


if __name__ == '__main__':
    app.run(port=5000, debug=True)

    # print("This is flask for " + os.path.basename(__file__) + ": manage guests ...")
    # app.run(host='0.0.0.0', port=5001, debug=True)
