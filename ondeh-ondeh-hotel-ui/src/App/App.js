import "./App.css";

// import react-router-dom
import {  BrowserRouter, Routes,    Route, Switch } from "react-router-dom";

// imports pages
import Home from "../Pages/Home";
import Room from "../Pages/Room";
import SingleRoom from "../Pages/SingleRoom";
import Login from "../Pages/Login";
import Booking from "../Pages/Booking";
import Summary from "../Pages/Summary";
import Error from "../Pages/Error";
import Payment from "../Pages/Payment";
import PaymentCompletion from "../Pages/PaymentCompletion"

// import components
import Navbar from "../Components/Navbar/Navbar";
import Footer from "../Components/Footer/Footer";

// // Stripe Imports
// import {Elements} from '@stripe/react-stripe-js';
// import {loadStripe} from '@stripe/stripe-js';

// // the key is located in the .env file
// const stripePromise = loadStripe(process.env.PUB_KEY);

function App() {
  return (
    <>
      <Navbar />
      <Switch>
        <Route exact path="/login/" component={Login} />
        <Route exact path="/" component={Home} />
        <Route exact path="/rooms/" component={Room} />
        {/* <Elements stripe={stripePromise}> */}
          <Route exact path="/rooms/:slug" component={SingleRoom} />
        {/* </Elements> */}
        <Route exact path="/booking/" component={Booking} />
        <Route exact path="/summary/" component={Summary} />
        <Route exact path="/payment" component={Payment} />
        <Route exact path="/completion" component={PaymentCompletion} />
        <Route component={Error} />
      </Switch>
      <Footer />
    </>
  );
}

export default App;
