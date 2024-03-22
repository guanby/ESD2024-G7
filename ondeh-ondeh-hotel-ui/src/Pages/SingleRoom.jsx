import React, { Component } from "react";

import { Link } from "react-router-dom";

// import assets
import defaultBackground from "../assets/img/jpg/room-1.jpg";

// import components
import Banner from "../Components/Banner/Banner";
import { RoomContext } from "../Context/Context";
import StyledHero from "../Components/StyledHero/StyledHero";

export default class SingleRoom extends Component {
  constructor(props) {
    super(props);
    // console.log(this.props);
    this.state = {
      slug: this.props.match.params.slug,
      defaultBackground,
    };
  }

  static contextType = RoomContext;
  // componentDidMount() {}

  render() {
    const { getRoom } = this.context;
    const room = getRoom(this.state.slug);

    if (!room) {
      return (
        <div className="error">
          <h3>no such room could be found!</h3>
          <Link to="/rooms" className="btn-primary">
            back to rooms
          </Link>
        </div>
      );
    }

    const { ThemeName, BedType, Price } = room;

    // const [mainImg, ...defaultImg] = images;
    // console.log(defaultImg);

    return (
      <>
        <StyledHero img={this.state.defaultBackground}>
          <Banner title={`${ThemeName} room`}>
            <Link to="/rooms" className="btn-primary">
              back to rooms
            </Link>
          </Banner>
        </StyledHero>

        <section className="single-room">
          <div className="single-room-images">

          </div>

          <div className="single-room-info">
            <article className="desc">
              <h3>details:</h3>
              <p>{BedType}</p>
            </article>

            <article className="info">
              <h3>information:</h3>
              <h6>price : ${Price}</h6>
              <h6>
                max capacity :{" "}
                {/* {capacity > 1 ? `${capacity} people` : `${capacity} person`} */}
              </h6>

            </article>
          </div>
        </section>

        <section className="room-extras">
          <h6>extras:</h6>
          <ul className="extras">
            {/* {extras.map((item, index) => {
              return <li key={index}> - {item}</li>;
            })} */}
          </ul>
        </section>

        <div style={{ display: 'flex', justifyContent: 'center', marginBottom: '20px' }}>
          <button className="btn-primary">Book Now</button>
        </div>
      </>
    );
  }
}
