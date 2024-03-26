import React from "react";

// import react-router-dom
import { Link } from "react-router-dom";

// imports components
import Hero from "../Components/Hero/Hero";
import Banner from "../Components/Banner/Banner";

function PaymentCompletion() {
  return (
    <>
     <Hero>
     <Banner title="Payment Completed" subtitle="Your booking has been confirmed! Thank you! 🎉">
        <Link to="/" className="btn-primary">
        back to home
        </Link>
     </Banner>
     </Hero>
    </>
  );
}

export default PaymentCompletion;

