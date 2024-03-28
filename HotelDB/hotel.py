import logging
from datetime import datetime

from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import and_, func

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root:root@localhost:3306/HotelDB'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

class Rooms(db.Model):
    __tablename__ = 'Rooms'
    RoomID = db.Column(db.Integer, primary_key=True)
    TypeID = db.Column(db.String(255), nullable=False)
    ThemeName = db.Column(db.String(255), nullable=False)
    BedType = db.Column(db.String(255), nullable=False)
    Date = db.Column(db.Date, nullable=False)
    IsAvailable = db.Column(db.Boolean, nullable=False)
    Price = db.Column(db.Float(precision=2), nullable=False)

    def __init__(self, RoomID, TypeID, ThemeName, BedType, Date, IsAvailable, Price):
        self.RoomID = RoomID
        self.TypeID = TypeID
        self.ThemeName = ThemeName
        self.BedType = BedType
        self.Date = Date
        self.IsAvailable = IsAvailable
        self.Price = Price

    def json(self):
        return {
            'RoomID': self.RoomID,
            'TypeID': self.TypeID,
            'ThemeName': self.ThemeName,
            'BedType': self.BedType,
            'Date': self.Date,
            'IsAvailable': self.IsAvailable,
            'Price': self.Price
        }

''' 
'''
'''
    1. GET Request by IsAvailable == True, can add query for start and end date, can add query for theme
'''
'''
'''
@app.route("/hotel/rooms/<string:date_range>", methods=['GET'])
def find_by_available_date(date_range):
    
    try:
        # Split the date_range string into start and end dates
        start_date_str, end_date_str = date_range.split('-')
        
        # Convert string to date object
        try:
            start_date = datetime.strptime(start_date_str, "%Y%m%d").date()
        except ValueError:
            return jsonify({'success': False, 'message': 'Invalid start date format. Please use YYYYMMDD.'}), 400
        
        try:
            end_date = datetime.strptime(end_date_str, "%Y%m%d").date()
        except ValueError:
            return jsonify({'success': False, 'message': 'Invalid end date format. Please use YYYYMMDD.'}), 400

    except ValueError as e:
        # Logs the error and returns a message if there's a problem parsing the dates
        logging.error(f"Date parsing error: {e}")
        return jsonify({'success': False, 'message': 'Invalid date format. Please use YYYYMMDD-YYYYMMDD.'}), 400

    # Check if the start date comes before the end date
    if start_date > end_date:
        return jsonify({'success': False, 'message': 'Start date must be before end date.'}), 400

    # Assuming start_date and end_date have been validated and are available here
    date_range_length = (end_date - start_date).days + 1  # Including both start and end dates

    # Query the database for rooms available on the specified date range
    # available_rooms = db.session.query(Rooms.RoomID, Rooms.TypeID, Rooms.ThemeName, Rooms.BedType, Rooms.Date, Rooms.Price)\
    #     .filter(Rooms.Date >= start_date, Rooms.Date <= end_date, Rooms.IsAvailable == True)\
    #     .group_by(Rooms.TypeID)\
    #     .having(func.count(Rooms.Date.distinct()) == date_range)\
    #     .all()

    # qualified_type_ids = db.session.query(
    #         Rooms.TypeID, Rooms.Date
    #     ).filter(
    #         Rooms.IsAvailable == True,
    #         Rooms.Date >= start_date,
    #         Rooms.Date <= end_date
    #     ).group_by(
    #         Rooms.TypeID
    #     ).having(
    #         func.count(Rooms.RoomID.distinct()) == date_range_length
    #     ).subquery()

    # available_room_types = db.session.query(
    #         Rooms.RoomID, Rooms.TypeID, Rooms.ThemeName, Rooms.BedType, Rooms.Date, Rooms.Price
    #     ).join(
    #         qualified_type_ids, Rooms.TypeID == qualified_type_ids.c.TypeID, Rooms.Date == qualified_type_ids.c.Date
    #     ).all()

    try:
        qualified_type_ids = db.session.query(
                Rooms.TypeID
            ).filter(
                Rooms.IsAvailable == True,
                Rooms.Date >= start_date,
                Rooms.Date <= end_date
            ).group_by(
                Rooms.TypeID
            ).having(
                func.count(func.distinct(Rooms.Date)) == date_range_length
            ).subquery('qualified_type_ids')

        available_room_types = db.session.query(
                Rooms.RoomID, Rooms.TypeID, Rooms.ThemeName, Rooms.BedType, Rooms.Date, Rooms.Price
            ).join(
                qualified_type_ids, and_(Rooms.TypeID == qualified_type_ids.c.TypeID)
            ).filter(
                Rooms.Date >= start_date, Rooms.Date <= end_date
            ).all()
    except Exception as e:
        logging.error(f"Database query error: {e}")
        return jsonify({'success': False, 'message': 'Error querying the database'}), 500

    
    logging.debug(f"Query Date Range: {start_date} to {end_date}, Available Rooms: {available_room_types}")

    if available_room_types:
        # Format the results as a list of dictionaries
        result = [{'RoomID': room.RoomID, 'TypeID': room.TypeID, 'ThemeName': room.ThemeName, 'BedType': room.BedType, 'Date': room.Date, 'Price': room.Price} for room in available_room_types]
        return jsonify(result)
    else:
        # If no available rooms are found, return a message
        return jsonify({'success': False, 'message': 'No available rooms found for the selected date'})

# @app.route("/hotel/rooms/", methods=['GET']) # /hotel/rooms?start=YYYY-MM-DD&amp;end=YYYY-MM-DD&amp;theme=Taylor%20Swift
# def find_by_available_date():
#     # means SELECT * FROM Rooms
#     available_rooms = db.session.scalars(db.select(Rooms))\
#         .filter(Rooms.IsAvailable == True)\
#         .all()

#     query = db.session.query(Rooms.RoomID, Rooms.ThemeName, Rooms.BedType, Rooms.Date, Rooms.Price)\
#         .filter(Rooms.IsAvailable == True)\
#         .all()

#     start_date_str = request.args.get('start')
#     end_date_str = request.args.get('end')

#     theme_name = request.args.get('theme')

#     # Date range filtering
#     if start_date_str and end_date_str:
#         try:
#             start_date = datetime.strptime(start_date_str, "%Y-%m-%d").date()
#             end_date = datetime.strptime(end_date_str, "%Y-%m-%d").date()
#             if start_date > end_date:
#                 raise ValueError("Start date must be before end date.")
#             query = query.filter(Rooms.Date >= start_date, Rooms.Date <= end_date)
    
#         except ValueError as e:
#             logging.error(f"Date parsing error: {e}")
#             return jsonify({'success': False, 'message': 'Invalid date format or logical error. Please use YYYY-MM-DD and ensure start date is before end date.'}), 400
    
#     # Theme filtering
#     if theme_name:
#         query = query.filter(Rooms.ThemeName==theme_name)

#     # logging.debug(f"Query Date Range: {start_date} to {end_date}, Available Rooms: {available_rooms}")

#     available_rooms = query

#     if available_rooms:
#         result = [{'RoomID': room.RoomID, 'ThemeName': room.ThemeName, 'BedType': room.BedType, 'Date': room.Date, 'Price': room.Price} for room in available_rooms]
#         return jsonify(result)
#     else:
#         return jsonify({'success': False, 'message': 'No available rooms found for the selected date range'})

''' 
'''
'''
    2. GET Request by ThemeName (where IsAvailable == True)
'''
'''
'''
# @app.route("/hotel/theme/<string:themeName>/rooms", methods=['GET'])
# def find_by_available_theme(themeName):
#     # Query logic to find rooms by themeName where IsAvailable is true
#     # Join the Rooms and Availability tables, filter by themeName and IsAvailable
#     # Return a JSON response with the list of available rooms for the theme
    
#     # Filtering rooms by ThemeName where IsAvailable is true
#     available_rooms = Rooms.query.filter_by(ThemeName=themeName, IsAvailable=True).all()
    
#     if available_rooms:
#         return jsonify([room.json() for room in available_rooms]), 200
#     else:
#         return jsonify({'message': 'No available rooms found for the specified theme'}), 404

'''
'''
'''
    3. GET request by IsAvailable==true    
'''
'''
'''
# @app.route("/hotel/rooms/available")
# def get_all_available_rooms():
#     # Query the database for all available rooms
#     # Note: The exact query might need adjustments based on the actual database schema and relationships
#     available_rooms_query = db.session.query(Rooms.RoomID, Rooms.ThemeName, Rooms.BedType, Rooms.Date, Rooms.IsAvailable, Rooms.Price)\
#                                        .filter(Rooms.IsAvailable == True)\
#                                        .all()

#     # Format the query results into a list of dictionaries for easier JSON serialization
#     available_rooms = [
#         {
#             'RoomID': room.RoomID,
#             'ThemeName': room.ThemeName,
#             'BedType': room.BedType,
#             'Date': room.Date,
#             'IsAvailable': room.IsAvailable,
#             'Price': str(room.Price)  # Convert decimal to string for JSON serialization
#         } for room in available_rooms_query
#     ]

#     # Check if the list is empty and return an appropriate message if no rooms are available
#     if not available_rooms:
#         return jsonify({'success': False, 'message': 'No available rooms found.'}), 404

#     # Return the list of available rooms as JSON
#     return jsonify({'success': True, 'available_rooms': available_rooms}), 200

    
'''
'''
'''
    PUT request by RoomID (to change IsAvailable value)
'''
'''
'''
@app.route("/book/<int:roomID>", methods=['PUT'])
def update_room_availability(roomID):
    # Logic to update the IsAvailable status of the specified room
    # Ensure that the request body contains the new IsAvailable value
    # Update the Availability table accordingly
    # Return a JSON response indicating success or failure

    data = request.get_json()
    new_status = data.get('IsAvailable')  # Convert string to boolean
    target_date = data.get('Date')  # Assuming 'date' is passed in 'YYYY-MM-DD' format

    try:
        target_date = datetime.strptime(target_date, "%Y-%m-%d").date()
    except ValueError:
        return jsonify({'code': 400, 'message': 'Invalid date format. Please use YYYY-MM-DD.'}), 400

    if new_status is None:
        return jsonify({'code': 400, 'message': 'IsAvailable field is missing or invalid.'}), 400

    # availability = Rooms.query.filter_by(RoomID=roomID, Date=target_date).first()
    result = Rooms.query.filter_by(RoomID=roomID, Date=target_date).update({'IsAvailable': new_status})
    if result:
            # availability.IsAvailable = new_status 
        db.session.commit()
        return jsonify({'code': 201, 'message': 'Room availability updated successfully.'})
    else:
        return jsonify({'code': 404, 'message': 'Room or date not found.'}), 404

'''
'''
'''
    PUT request by RoomID (to change Price value)
'''
'''
'''
@app.route("/hotel/room/<int:roomID>/price", methods=['PUT'])
def update_room_price(roomID):
    # Logic to update the price of the specified room
    # Ensure that the request body contains the new price value
    # Update the Rooms table accordingly
    # Return a JSON response indicating success or failure

    data = request.get_json()
    target_date = data.get('Date')  # Assuming 'date' is passed in 'YYYY-MM-DD' format
    new_price = data.get('Price')

    try:
        target_date = datetime.strptime(target_date, "%Y-%m-%d").date()
    except ValueError:
        return jsonify({'code': 400, 'message': 'Invalid date format. Please use YYYY-MM-DD.'}), 400

    room = Rooms.query.filter_by(RoomID=roomID, Date=target_date).first()
    if room:
        room.Price = new_price  # Assuming 'Price' is a column in the 'Rooms' table
        db.session.commit()
        return jsonify({'code': 201, 'message': 'Room price updated successfully.'})
    else:
        return jsonify({'code': 400, 'message': 'Room not found.'}), 404



# @app.route("/book/<int:roomID>", methods=['POST'])
# def book_hotel_room(roomID):
#     # Assuming 'date' is passed in the JSON body of the request
#     data = request.get_json()
#     booking_date = data.get('date')
#     availability = Availability.query.filter((Availability.RoomID == roomID, Availability.Date == booking_date)).first()
#     if availability and availability.IsAvailable:
#         # Mark as booked (not available)
#         availability.IsAvailable = False
#         db.session.commit()
#         return jsonify({'success': True, 'message': 'Booking successful'})
#     else:
#         return jsonify({'success': False, 'message': 'Room not available for the selected date'})


if __name__ == '__main__':
    # not running on localhost, so you allow other machines to connect
    app.run(host='0.0.0.0', port=5000, debug=True)

