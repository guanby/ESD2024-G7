import React, { useState, useEffect } from "react";
import { Elements } from '@stripe/react-stripe-js';
import { loadStripe } from "@stripe/stripe-js";
import CheckoutForm from "./CheckoutForm";
import axios from "axios";

// import react-router-dom
import { Link } from "react-router-dom";

function Booking() {
  const [stripePromise, setStripePromise] = useState(null);
  const [clientSecret, setClientSecret] = useState("");

  useEffect(() => {
    fetch("http://localhost:5252/config").then(async (r) => {
    // get stripe public API key
      const { publishableKey } = await r.json();
      console.log('Stripe Publishable Key:', publishableKey);
      setStripePromise(loadStripe(publishableKey));
    });
  }, []);

  useEffect(() => {
    fetch("http://localhost:5252/create-payment-intent", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ rooms: [{ RoomID: 1, RoomName: "Safari Adventure"}]}),
    }).then(async (result) => {

      var { clientSecret } = await result.json();
    //   var { clientSecret } = JSON.parse(result);

      console.log(clientSecret);
      setClientSecret(clientSecret);
    });

  }, []);
  
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

  const handleSubmit = (e) => {
    e.preventDefault();
    // Perform booking confirmation logic here
    
    // Get form data
    const formData = {
      "GuestID": 1, 
      "RoomID": 1,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "contactNumber": contactNumber,
      "checkInDate": checkInDate,
      "checkOutDate": checkOutDate,
      // Add more fields as needed
    };
    console.log(formData);
  
    try {
      // Send POST request to backend
      const response = axios.post('http://localhost:5100/book', formData, {
        headers: {
          "Content-Type": "application/json"
        }
      });
      console.log(response.data);
    } catch (error) {
      console.error(error);
    }


    console.log("Booking confirmed:", formData);
  };

  //state variables 
  const [email, setEmail] = useState('');
  const [firstName, setfirstName] = useState('');
  const [lastName, setlastName] = useState('');
  const [contactNumber, setContactNumber] = useState('');
  const [checkInDate, setcheckInDate] = useState('');
  const [checkOutDate, setcheckOutDate] = useState('');
  const [numOfAdults, setnumOfAdults] = useState('');
  const [numOfChild, setnumOfChild] = useState('');
  const saveSession = async () => {
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
    <div className="forms-container">
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
            <label htmlFor="email">Email Address</label>
            <input
              type="text"
              id="email"
              placeholder="abc@email.com"
              onChange={(e) => setEmail(e.target.value)}
              value={email}
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
          <button className="btn-primary" onSubmit={handleSubmit} type="submit">Check Availability</button>
        </form>
      </div>

      <div className="stripe-container">
        <h2>Payment Info</h2>
        {clientSecret && stripePromise && (
          <Elements stripe={stripePromise} options={{ clientSecret }}>
            <CheckoutForm />
          </Elements>
        )}

      </div>
    </div>
    
    
    </>
  );
}

export default Booking;
