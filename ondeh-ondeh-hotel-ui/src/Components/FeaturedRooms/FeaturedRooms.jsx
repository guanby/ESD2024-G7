import React, { Component } from "react";

// import context
import { RoomContext } from "../../Context/Context";

// import components
import Loading from "../Loading/Loading";
import Room from "../Room/Room";
import Title from "../Title/Title";


export default class FeaturedRooms extends Component {
  static contextType = RoomContext;

  render() {
    let { loading, rooms: themes } = this.context;
    console.log(themes);
    //Pass ThemedRooms data and map into Room component 
    themes = themes.map((room) => {
      return <Room key={room.ThemeID} room={room} />;
    });

    return (
      <section className="featured-rooms">
        <Title title="featured rooms" />

        <div className="featured-rooms-center">
          {loading ? <Loading /> : themes}
        </div>
      </section>
    );
  }
}
