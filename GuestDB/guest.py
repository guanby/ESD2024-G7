from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import logging

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root:root@localhost:3306/HotelDB'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)


class User(db.Model):
    __tablename__ = 'User'
    UserID = db.Column(db.Integer, primary_key=True)

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
    API = db.Column(db.String(255), nullable=True)


@app.route("/users")
def get_all_users():
    users = User.query.all()
    return jsonify(
        [{
            'UserID': user.UserID, 
            'Username': user.Username, 
            'Email': user.Email,
            'PhoneNumber': user.PhoneNumber
        } for user in users]
    )

@app.route("/user/<int:UserID>")
def find_by_user(UserID):
    pass


if __name__ == '__main__':
    app.run(port=5000, debug=True)
