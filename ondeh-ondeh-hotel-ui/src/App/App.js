import "./App.css";

// import react-router-dom
import { Route, Switch } from "react-router-dom";

// imports pages
import Home from "../Pages/Home";
import Room from "../Pages/Room";
import SingleRoom from "../Pages/SingleRoom";
import Error from "../Pages/Error";

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
        <Route exact path="/" component={Home} />
        <Route exact path="/rooms/" component={Room} />
        {/* <Elements stripe={stripePromise}> */}
          <Route exact path="/rooms/:slug" component={SingleRoom} />
        {/* </Elements> */}
        <Route component={Error} />
      </Switch>
      <Footer />
    </>
  );
}

export default App;
