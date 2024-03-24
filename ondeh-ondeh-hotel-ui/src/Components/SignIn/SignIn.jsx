import React, { useState } from "react";
import ReactDOM from 'react-dom';
// import react-router-dom
import { Link } from "react-router-dom";

export default function SignIn() {
  const [email, setEmail] = useState('');
  const saveSession = () => {
    window.sessionStorage.setItem("email", email);
  }
  return (
    <div className="login-container">
      <h2>Login</h2>
      <form>
        <div className="form-group">
          <label htmlFor="email">Email</label>
          <input
            type="email"
            id="email"
            placeholder="email@mail.com"
            onChange={(e) => setEmail(e.target.value)}
            value={email}
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="password">Password</label>
          <input
            type="password"
            id="password"
            placeholder="Password"
            required
          />
        </div>
        <Link to="/"><button className="btn-primary" onClick={saveSession} type="submit">Login</button></Link>
      </form>
      {/* <p>
        Don't have an account? <Link to="/signup">Sign Up</Link>
      </p> */}
    </div>
  );
}
