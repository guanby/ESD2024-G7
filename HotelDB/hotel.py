from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import logging

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root@localhost:3306/HotelDB'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)


class ThemedRooms(db.Model):
    __tablename__ = 'ThemedRooms'
    ThemeID = db.Column(db.Integer, primary_key=True)
    ThemeName = db.Column(db.String(255), nullable=False)
    BedType = db.Column(db.String(255), nullable=False)

    def json(self):
        return {
            'ThemeID': self.ThemeID,
            'ThemeName': self.ThemeName,
            'BedType': self.BedType,
        }

class Rooms(db.Model):
    __tablename__ = 'Rooms'
    RoomID = db.Column(db.Integer, primary_key=True)
    ThemeID = db.Column(db.Integer, db.ForeignKey('ThemedRooms.ThemeID'), nullable=False)
    RoomNumber = db.Column(db.String(50), nullable=False)

class Availability(db.Model):
    __tablename__ = 'Availability'
    AvailabilityID = db.Column(db.Integer, primary_key=True)
    RoomID = db.Column(db.Integer, db.ForeignKey('Rooms.RoomID'), nullable=False)
    Date = db.Column(db.Date, nullable=False)
    IsAvailable = db.Column(db.Boolean, nullable=False)
    
    def __init__(self, isbn13, title, price, availability):
        self.isbn13 = isbn13
        self.title = title
        self.price = price
        self.availability = availability


    def json(self):
        return {"isbn13": self.isbn13, "title": self.title, "price": self.price, "availability": self.availability}


@app.route("/hotel/themes")
def get_all_themes():
    # themes = ThemedRooms.query.all()
    themeslist = db.session.scalars(db.select(ThemedRooms)).all()
    if len(themeslist):
        return jsonify(
            {
                "code": 200,
                "data": {
                    "themedRooms": [theme.json() for theme in themeslist]
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "There are no themed rooms."
        }
    ), 404
    

@app.route("/hotel/<string:themeName>/rooms")
def find_by_theme(themeName):
    themed_rooms = db.session.query(Rooms).join(ThemedRooms).filter(ThemedRooms.ThemeName == themeName).all()
    return jsonify([{'RoomID': room.RoomID, 'RoomNumber': room.RoomNumber} for room in themed_rooms])


@app.route("/hotel/<string:date>/rooms")
def find_by_available_date(date):
    try:
        # Convert string to date object
        query_date = datetime.strptime(date, "%Y-%m-%d").date()
    except ValueError as e:
        logging.error(f"Date parsing error: {e}")
        # If the date format is incorrect, return an error message
        return jsonify({'success': False, 'message': 'Invalid date format. Please use YYYY-MM-DD.'}), 400
    
    # Query the database for rooms available on the specified date
    available_rooms = db.session.query(Availability.RoomID, Rooms.ThemeID)\
        .join(Rooms, Availability.RoomID == Rooms.RoomID)\
        .filter(Availability.Date == query_date, Availability.IsAvailable == True).all()
    
    logging.debug(f"Query Date: {query_date}, Available Rooms: {available_rooms}")

    if available_rooms:
        # Format the results as a list of dictionaries
        result = [{'RoomID': room.RoomID, 'ThemeID': room.ThemeID} for room in available_rooms]
        return jsonify(result)
    else:
        # If no available rooms are found, return a message
        return jsonify({'success': False, 'message': 'No available rooms found for the selected date'})

@app.route("/book/<int:roomID>", methods=['POST'])
def book_hotel_room(roomID):
    # Assuming 'date' is passed in the JSON body of the request
    data = request.get_json()
    booking_date = data.get('date')
    availability = Availability.query.filter(and_(Availability.RoomID == roomID, Availability.Date == booking_date)).first()
    if availability and availability.IsAvailable:
        # Mark as booked (not available)
        availability.IsAvailable = False
        db.session.commit()
        return jsonify({'success': True, 'message': 'Booking successful'})
    else:
        return jsonify({'success': False, 'message': 'Room not available for the selected date'})


if __name__ == '__main__':
    app.run(port=5000, debug=True)
