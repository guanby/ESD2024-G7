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
    1. GET Request for ALL bookmark records for a specific Guest
           (Guest need to be logged in first, session should include GuestID)
'''
'''
'''
@app.route("/hotel/bookmarks/<int:guestID>", methods=['GET'])
def get_all_bookmarks(guestID):
    # Filtering logic
    bookmarklist = Bookmark.query.filter_by(GuestID=guestID).all()
    
    # bookmarklist = db.session.scalars(db.select(Bookmark)).all()

    if len(bookmarklist):
        return jsonify([bookmark.json() for bookmark in bookmarklist]), 200
    
    else:
        return jsonify({"message": "No bookmarks found for the guest."}), 404

''' 
'''
'''
    2. DELETE req to delete a bookmark for a specific Guest
''' 
'''
''' 
@app.route("/hotel/bookmarks/<int:guestID>/<int:bookmarkID>", methods=['DELETE'])
def delete_bookmark(guestID, bookmarkID):
    # Filtering logic
    bookmark = Bookmark.query.filter_by(GuestID=guestID, BookmarkID=bookmarkID).first()

    if bookmark:
        db.session.delete(bookmark)
        db.session.commit()
        return jsonify({"message": "Bookmark deleted successfully."})
    else:
        return jsonify({"message": "Bookmark not found."}), 404


''' 
'''
'''
    3. POST req to create a new bookmark for a specific Guest
''' 
'''
''' 
@app.route("/hotel/bookmarks/<int:guestID>/<int:roomID>", methods=['POST'])
def create_bookmark(guestID, roomID):
    # Filtering logic
    bookmark = Bookmark.query.filter_by(GuestID=guestID, RoomID=roomID).first()

    if bookmark:
        return jsonify({"message": "Bookmark already exists."}), 409
    else:
        new_bookmark = Bookmark(GuestID=guestID, RoomID=roomID)
        db.session.add(new_bookmark)
        db.session.commit()
        return jsonify({"message": "Bookmark added successfully.", "BookmarkID": new_bookmark.BookmarkID}), 201


if __name__ == '__main__':
    app.run(debug=True)
