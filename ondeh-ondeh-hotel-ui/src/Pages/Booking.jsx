import React, { useState } from "react";
// import react-router-dom
import { Link } from "react-router-dom";

function Booking() {
  // const [formData, setFormData] = useState({
  //   firstName: "",
  //   lastName: "",
  //   email: "",
  //   checkInDate: "",
  //   checkOutDate: ""
  // });

  // const handleInputChange = (e) => {
  //   const { name, value } = e.target;
  //   setFormData((prevData) => ({
  //     ...prevData,
  //     [name]: value
  //   }));
  // };

  // const handleSubmit = (e) => {
  //   e.preventDefault();
  //   // Perform booking confirmation logic here
  //   console.log("Booking confirmed:", formData);
  // };

  const [email, getEmail] = useState('');
  const [firstName, setfirstName] = useState('');
  const [lastName, setlastName] = useState('');
  const [contactNumber, setContactNumber] = useState('');
  const [checkInDate, setcheckInDate] = useState('');
  const [checkOutDate, setcheckOutDate] = useState('');
  const [numOfAdults, setnumOfAdults] = useState('');
  const [numOfChild, setnumOfChild] = useState('');
  const saveSession = () => {
    // get session email
    window.sessionStorage.getItem("email", email);
    window.sessionStorage.setItem("firstName", firstName);
    window.sessionStorage.setItem("lastName", lastName);
    window.sessionStorage.setItem("contactNumber", contactNumber);
    window.sessionStorage.setItem("checkInDate", checkInDate);
    window.sessionStorage.setItem("checkOutDate", checkOutDate);
    window.sessionStorage.setItem("numOfAdults", numOfAdults);
    window.sessionStorage.setItem("numOfChild", numOfChild);
  }
  return (
    <>
    <div className="booking-container">
      <h2>Check-In Info</h2>
      <form>
        <div className="form-group">
          <label htmlFor="firstName">First Name</label>
          <input
            type="text"
            id="firstName"
            placeholder="First Name"
            onChange={(e) => setfirstName(e.target.value)}
            value={firstName}
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="lastName">Last Name</label>
          <input
            type="text"
            id="lastName"
            placeholder="Last Name"
            onChange={(e) => setlastName(e.target.value)}
            value={lastName}
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="contactNumber">Contact Number</label>
          <input
            type="text"
            id="contactNumber"
            placeholder="87654321"
            onChange={(e) => setContactNumber(e.target.value)}
            value={contactNumber}
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="checkInDate">Check-In Date</label>
          <input
            type="date"
            id="checkInDate"
            name="checkInDate"
            onChange={(e) => setcheckInDate(e.target.value)}
            value={checkInDate}
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="checkOutDate">Check-Out Date</label>
          <input
            type="date"
            id="checkOutDate"
            name="checkOutDate"
            onChange={(e) => setcheckOutDate(e.target.value)}
            value={checkOutDate}
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="numOfAdults">Number of adults</label>
          <input
            type="number"
            id="numOfAdults"
            onChange={(e) => setnumOfAdults(e.target.value)}
            value={numOfAdults}
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="numOfChild">Number of children</label>
          <input
            type="number"
            id="numOfChild"
            onChange={(e) => setnumOfChild(e.target.value)}
            value={numOfChild}
            required
          />
        </div>
        <Link to="/summary"><button className="btn-primary" onClick={saveSession} type="submit">Check Availability</button></Link>
      </form>
    </div>
    </>
  );
}

export default Booking;
