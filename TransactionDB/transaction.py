from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root:@localhost:3306/TransactionDB'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

class Transaction(db.Model):
    __tablename__ = 'Transaction'
    TxnID = db.Column(db.Integer, primary_key=True)
    GuestID = db.Column(db.String(255), nullable=False)
    RoomID = db.Column(db.String(255), nullable=False)
    Amount = db.Column(db.Integer, nullable=False)
    Status = db.Column(db.String(50), nullable=False)
    TransactionDatetime = db.Column(db.Date, nullable=False)


@app.route("/transactions")
def get_all_transactions():
    
    transactions = Transaction.query.all()

    transaction_list = [] # list to store txns

    for transaction in transactions:
        transaction_data = {
            'TxnID': transaction.TxnID,
            'GuestID': transaction.GuestID,
            'RoomID': transaction.RoomID,
            'Amount': transaction.Amount,
            'Status': transaction.Status,
            'TransactionDatetime': transaction.TransactionDatetime.strftime("%d/%m/%Y %H:%M:%S")  # Format date as string
        }
        transaction_list.append(transaction_data)

    return jsonify(transaction_list)


@app.route("/transactions/<int:guest_id>")
def find_transactions_by_guest_id(guest_id):
    # Query transactions by guest ID
    transactions = Transaction.query.filter_by(GuestID = guest_id).all()

    transaction_list = []

    for transaction in transactions:
        transaction_data = {
            'TxnID': transaction.TxnID,
            'GuestID': transaction.GuestID,
            'RoomID': transaction.RoomID,
            'Amount': transaction.Amount,
            'Status': transaction.Status,
            'TransactionDatetime': transaction.TransactionDatetime.strftime("%d/%m/%Y %H:%M:%S")  # Format date as string
        }
        transaction_list.append(transaction_data)

    # Return the list of transactions for the specified guest ID as JSON response
    return jsonify(transaction_list)
    

@app.route("/transactions", methods=["POST"])
def add_transaction():
    data = request.json

    # Extract transaction details from the JSON data
    guest_id = data.get('GuestID')
    room_id = data.get('RoomID')
    amount = data.get('Amount')
    status = data.get('Status')
    transaction_datetime = data.get('TransactionDatetime')

    # Create a new Transaction object
    new_transaction = Transaction(
        GuestID=guest_id,
        RoomID=room_id,
        Amount=amount,
        Status=status,
        TransactionDatetime=transaction_datetime
    )

    # Save the new transaction to the database
    try:
        # new_transaction.save()
        db.session.add(new_transaction)
        db.session.commit()

        success_message = {
            'message': 'Transaction added successfully',
            'transaction': {
                'TxnID': new_transaction.TxnID,
                'GuestID': new_transaction.GuestID,
                'RoomID': new_transaction.RoomID,
                'Amount': new_transaction.Amount,
                'Status': new_transaction.Status,
                'TransactionDatetime': new_transaction.TransactionDatetime.strftime("%d/%m/%Y %H:%M:%S")  # Format date as string
            }
        }
        return jsonify(success_message), 201
    
    except Exception as e:
        return jsonify({'error': str(e)}), 400

# update transaction
@app.route("/transactions/<int:txn_id>", methods=["PUT"])
def update_transaction(txn_id):
    data = request.json

    transaction = Transaction.query.get(txn_id)

    if transaction:
        # Update transaction details
        if 'GuestID' in data:
            transaction.GuestID = data['GuestID']
        if 'RoomID' in data:
            transaction.RoomID = data['RoomID']
        if 'Amount' in data:
            transaction.Amount = data['Amount']
        if 'Status' in data:
            transaction.Status = data['Status']
        if 'TransactionDatetime' in data:
            transaction.TransactionDatetime = data['TransactionDatetime']

        try:
            # Commit the changes to the database
            db.session.commit()

            return jsonify({'message': 'Transaction updated successfully'}), 200
        
        except Exception as e:
            return jsonify({'error': str(e)}), 400
    else:
        return jsonify({'error': 'Transaction not found'}), 404

if __name__ == '__main__':
    app.run(port=5002, debug=True)

    # print("This is flask for " + os.path.basename(__file__) + ": manage transactions ...")
    # app.run(host='0.0.0.0', port=5001, debug=True)
