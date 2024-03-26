import React, { useEffect, useState } from "react";
// import react-router-dom
import { Link } from "react-router-dom";
import Banner from "../Components/Banner/Banner";
import FeaturedRooms from "../Components/FeaturedRooms/FeaturedRooms";
// imports components
import Hero from "../Components/Hero/Hero";
import Services from "../Components/Services/Services";

function Home() {
  const [themes, setThemedRooms] = useState([]);

  // fetch hotel room data from hotel.py flask backend
  useEffect(() => {
    fetch('/hotel/rooms/available')
      .then(response => response.json())
      .then(data => setThemedRooms(data.data.themedRooms)) 
      .catch(error => console.error('Error:', error));
  }, []);

  return (
    <>
      <Hero>
        <Banner
          title="the best 5-star hotel"
          subtitle="luxury is not a place, it's an experience"
        >
          <Link to="/rooms" className="btn-primary">
            book now
          </Link>
        </Banner>
      </Hero>
      <Services />
      <FeaturedRooms themes = {themes}/>
    </>
  );
}

export default Home;
