// This is your test secret API key.
const express = require('express');
// const bodyParser = require("body-parser")
const cors = require("cors")
const { resolve } = require("path");
require("dotenv").config({ path: "./.env" });
const stripe = require('stripe')(process.env.STRIPE_SECRET_KEY);

const app = express();
app.use(express.static('public'));

// app.use(bodyParser.urlencoded({ extended: true }))
// app.use(bodyParser.json())

app.use(cors())

const YOUR_DOMAIN = 'http://localhost:3000';

app.get("/config", (req, res) => {
    res.send({
      publishableKey: process.env.STRIPE_PUBLISHABLE_KEY,
    });
  });

const calculatePrice = items => {

} 

app.post("/create-payment-intent", async (req, res) => {
  // get room details from frontend, get specific priceid based on room name
  // const { items } = req.body;

  // get booking info from createBooking MS
  const bookingInfo = req.body;
  console.log(bookingInfo);
  // const roomData = bookingInfo.roomData;
  // const guestData = bookingInfo.guestData;

  // get room name from booking info

  // check stripe products with name = room name, get price id and amount
  
  // create payment intent 
  try {
    const paymentIntent = await stripe.paymentIntents.create({
      currency: "SGD",
      // to be changed to dynamic price data from product retrieved 
      amount: 15000,
      automatic_payment_methods: { enabled: true },
    });

    // Send publishable key and PaymentIntent details to client
    res.send({
      code: 201,
      clientSecret: paymentIntent.client_secret,
    });
  } catch (e) {
    return res.status(400).send({
      error: {
        message: e.message,
      },
    });
  }
});

app.get("/success", (req, res) => {
  res.send("Payment successful! A confirmation message has been sent to you!");
});

app.get("/cancel", (req, res) => {
  res.send("Payment Cancelled! Your order was not processed");
}); 

app.post('/checkout', async (req, res) => {


  const session = await stripe.checkout.sessions.create({
    ui_mode: 'embedded',
    line_items: [
      {
        // Provide the exact Price ID (for example, pr_1234) of the product you want to sell
        price: 'price_1Ov7sZGXpCgBeboT1QEpANWq',
        quantity: 1,
      },
    ],
    mode: 'payment',
    return_url: `${YOUR_DOMAIN}/return?session_id={CHECKOUT_SESSION_ID}`,
  });

  res.send({clientSecret: session.client_secret});
});

app.get('/session-status', async (req, res) => {
  const session = await stripe.checkout.sessions.retrieve(req.query.session_id);

  res.send({
    status: session.status,
    customer_email: session.customer_details.email
  });
});

app.listen(5252, () => console.log('Running on port 5252'));