import logging
from datetime import datetime

from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root:root@localhost:3306/HotelDB'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

class Bookmark(db.Model):
    __tablename__ = 'Bookmark'
    BookmarkID = db.Column(db.Integer, primary_key=True)
    GuestID = db.Column(db.Integer, nullable=False)
    RoomID = db.Column(db.Integer, nullable=False)

    def __init__(self, BookmarkID, GuestID, RoomID):
        self.BookmarkID = BookmarkID
        self.GuestID = GuestID
        self.RoomID = RoomID
        
    def json(self):
        return {
            'BookmarkID': self.BookmarkID,
            'GuestID': self.GuestID,
            'RoomID': self.RoomID,
        }

''' 
'''
'''
    1. GET Request for ALL bookmark records
'''
'''
'''
@app.route("/hotel/bookmarks", methods=['GET'])
def get_all_bookmarks():
    bookmarklist = db.session.scalars(db.select(Bookmark)).all()

    if len(bookmarklist):
        return jsonify([bookmark.json() for bookmark in bookmarklist]), 200
    
    return jsonify(
        {
            "code": 404,
            "message": "There are no bookmarks currently."
        }
    ), 404

