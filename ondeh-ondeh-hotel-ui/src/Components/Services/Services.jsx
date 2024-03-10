import React, { Component } from "react";

// imports react-icons
import { FaShuttleVan, FaParking, FaCocktail } from "react-icons/fa";
import { MdEvent } from "react-icons/md";

// imports components
import Title from "../Title/Title";

export default class Services extends Component {
  state = {
    services: [
      {
        icon: <FaShuttleVan />,
        title: "free shuttle",
        info:
          "We provide free shuttle services from our hotel to the nearest MRT",
      },
      {
        icon: <MdEvent />,
        title: "themed events",
        info:
          "Looking to hold an event here? Contact us and choose a theme!",
      },
      {
        icon: <FaParking />,
        title: "free parking",
        info:
          "No extra charges for parking! (Limited to 1 car per room)",
      },
      {
        icon: <FaCocktail />,
        title: "cocktail bar",
        info:
          "Enjoy a cocktail bar in the comfort of your own room!",
      },
    ],
  };

  render() {
    return (
      <section className="services">
        <Title title="services" />

        <div className="services-center">
          {this.state.services.map((item, index) => {
            return (
              <article key={index} className="services">
                <span>{item.icon}</span>
                <h6>{item.title}</h6>
                <p>{item.info}</p>
              </article>
            );
          })}
        </div>
      </section>
    );
  }
}
