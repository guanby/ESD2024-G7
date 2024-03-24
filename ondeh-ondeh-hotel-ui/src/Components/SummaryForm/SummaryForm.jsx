import React, { useState, useEffect } from "react";

import { Link } from "react-router-dom";

export default function SummaryForm() {
    const [firstName, setFirstName] = useState('');
    const [lastName, setLastName] = useState('');
    const [contactNumber, setContactNumber] = useState('');
    const [checkInDate, setCheckInDate] = useState('');
    const [checkOutDate, setCheckOutDate] = useState('');
    const [numOfAdults, setNumOfAdults] = useState('');
    const [numOfChild, setNumOfChild] = useState('');
    useEffect(() => {
        // Retrieve values from session storage when the component mounts
        const storedFirstName = window.sessionStorage.getItem("firstName");
        const storedLastName = window.sessionStorage.getItem("lastName");
        const storedContactNumber = window.sessionStorage.getItem("contactNumber");
        const storedCheckInDate = window.sessionStorage.getItem("checkInDate");
        const storedCheckOutDate = window.sessionStorage.getItem("checkOutDate");
        const storedNumOfAdults = window.sessionStorage.getItem("numOfAdults");
        const storedNumOfChild = window.sessionStorage.getItem("numOfChild");
    
        // Set the state variables with the retrieved values
        setFirstName(storedFirstName || '');
        setLastName(storedLastName || '');
        setContactNumber(storedContactNumber || '');
        setCheckInDate(storedCheckInDate || '');
        setCheckOutDate(storedCheckOutDate || '');
        setNumOfAdults(storedNumOfAdults || '');
        setNumOfChild(storedNumOfChild || '');
      }, []);
  return (
    <div className="booking-container">
      <h2>Check-In Info</h2>
      <form>
        <div className="form-group">
          <label htmlFor="firstName">First Name</label>
          <input
            type="text"
            id="firstNameDisabled"
            placeholder="First Name"
            onChange={(e) => setFirstName(e.target.value)}
            value={firstName}
            disabled
          />
        </div>
        <div className="form-group">
          <label htmlFor="lastName">Last Name</label>
          <input
            type="text"
            id="lastNameDisabled"
            placeholder="Last Name"
            // onChange={(e) => setlastName(e.target.value)}
            value={lastName}
            disabled
          />
        </div>
        <div className="form-group">
          <label htmlFor="contactNumber">Contact Number</label>
          <input
            type="text"
            id="contactNumberDisabled"
            placeholder="Contact Number"
            // onChange={(e) => setlastName(e.target.value)}
            value={contactNumber}
            disabled
          />
        </div>
        <div className="form-group">
          <label htmlFor="checkInDate">Check-In Date</label>
          <input
            type="date"
            id="checkInDate"
            name="checkInDate"
            // onChange={(e) => setcheckInDate(e.target.value)}
            value={checkInDate}
            disabled
          />
        </div>
        <div className="form-group">
          <label htmlFor="checkOutDate">Check-Out Date</label>
          <input
            type="date"
            id="checkOutDate"
            name="checkOutDate"
            // onChange={(e) => setcheckOutDate(e.target.value)}
            value={checkOutDate}
            disabled
          />
        </div>
        <div className="form-group">
          <label htmlFor="numOfAdults">Number of adults</label>
          <input
            type="number"
            id="numOfAdultsDisabled"
            // onChange={(e) => setnumOfAdults(e.target.value)}
            value={numOfAdults}
            disabled
          />
        </div>
        <div className="form-group">
          <label htmlFor="numOfChild">Number of children</label>
          <input
            type="number"
            id="numOfChildDisabled"
            // onChange={(e) => setnumOfChild(e.target.value)}
            value={numOfChild}
            disabled
          />
        </div>
        <div className="form-group">
          <label htmlFor="price">Total Price</label>
          <div>$600</div>
        </div>
        <Link to="/payment"><button className="btn-primary" type="submit">Proceed to Payment</button></Link>
      </form>
    </div>
  );
}
