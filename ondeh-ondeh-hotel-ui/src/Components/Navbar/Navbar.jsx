import React, { Component } from "react";
import { Link } from "react-router-dom";
import Logo from "../../assets/img/svg/logo.svg";
import { FaAlignRight } from "react-icons/fa";

export default class Navbar extends Component {
  state = {
    isOpen: false,
    isSignedIn: false,
  };

  componentDidMount() {
    const email = sessionStorage.getItem("email");
    this.setState({ isSignedIn: !!email });
  }

  handleToggle = () => {
    this.setState({ isOpen: !this.state.isOpen });
  };

  logout = () => {
    sessionStorage.removeItem("email");
    this.setState({ isSignedIn: false });
  };

  render() {
    const { isOpen, isSignedIn } = this.state;

    return (
      <nav className="navbar">
        <div className="nav-center">
          <div className="nav-header">
            {/* app logo */}
            <Link to="/">
              <img src={Logo} alt="Ondeh-ondeh Hotel" />
            </Link>
            {/* navbar toggle button */}
            <button type="button" className="nav-btn" onClick={this.handleToggle}>
              <FaAlignRight className="nav-icon" />
            </button>
          </div>
          {/* navbar link */}
          <ul className={isOpen ? "nav-links show-nav" : "nav-links"}>
            <li>
              <Link to="/">Home</Link>
            </li>
            <li>
              <Link to="/rooms">Rooms</Link>
            </li>
            <li>
              {isSignedIn ? (
                <Link to="/" onClick={this.logout}>
                  Logout
                </Link>
              ) : (
                <Link to="/login">Login</Link>
              )}
            </li>
          </ul>
        </div>
      </nav>
    );
  }
}