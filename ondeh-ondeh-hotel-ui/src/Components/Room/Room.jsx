import React from "react";

// import react-router-dom
import { Link } from "react-router-dom";

// import assets
import defaultImg from "../../assets/img/jpg/room-1.jpg";

// import prop-types
import PropTypes from "prop-types";

export default function Room({ room }) {
  const { ThemeName, Price } = room;


  
  return (
    <article className="room">
      <div className="img-container">
        <img src={ defaultImg} alt="single room" />

        <div className="price-top">
          <h6>$ {Price}</h6>
          <p>per night</p>
        </div>

        <Link to={`/rooms/${ThemeName}`} className="btn-primary room-link">
          Feature
        </Link>
      </div>
      <p className="room-info">{ThemeName}</p>
    </article>
  );
}

Room.prototype = {
  room: PropTypes.shape({
    ThemeName: PropTypes.string.isRequired,
    // slug: PropTypes.string.isRequired,
    // images: PropTypes.arrayOf(PropTypes.string).isRequired,
    Price: PropTypes.number.isRequired,
  }),
};
