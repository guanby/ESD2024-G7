import React, { Component } from "react";

// import data
// import items from "../Data/data";

// react context-api
const RoomContext = React.createContext();

class RoomProvider extends Component {
  state = {
    rooms: [],
    sortedRooms: [],
    featuredRooms: [],
    loading: true,
    type: "all",
    ThemeName: "",
    BedType: "",
    Date: "",
    IsAvailable: 1,
    price: 0,
    minPrice: 0,
    maxPrice: 0,
    gym: false,
    bar: false,
  };

  // getDate
  componentDidMount() {
    // fetch data from backend
    fetch('/hotel/rooms/available')
      .then(response => response.json())
      .then(data => {
        const { themedRooms } = data.data;
        const rooms = this.formatData(themedRooms);
        // const featuredRooms = rooms.filter((room) => room.featured === true);

        const maxPrice = Math.max(...rooms.map((item) => item.Price));


        this.setState({
          rooms,
          // featuredRooms,
          sortedRooms: rooms,
          loading: false,
          price: maxPrice,
          maxPrice,
          // maxSize,
        });

        // console.log(featuredRooms);

      })
      .catch(error => console.error('Error:', error));
    
  }

  formatData(themedRooms) {
    return themedRooms.map((room) => {
      const { RoomID, ThemeName, BedType, Date, IsAvailable, Price } = room;

      // const formattedImages = images.map((image) => image.url);
      // const formattedRoom = { id, name, slug, type, price, IsAvailable, bar, gym, featured, description, extras, images: formattedImages };
      // const formattedRoom = { id, name, slug, type, price, IsAvailable, bar, gym, featured, description, extras};
      const formattedRoom = { RoomID, ThemeName, BedType, Date, IsAvailable, Price};


      return formattedRoom;
    });
  }

  getRoom = (slug) => {
    let tempRooms = [...this.state.rooms];
    console.log(tempRooms);
    const room = tempRooms.find((room) => room.ThemeName === slug);
    return room;
  };

  handleChange = (event) => {
    /* const type = event.target.type;
    const name = event.target.name;
    const value = event.target.value; */
    /* console.log(
      `this is type: ${type}, this is name: ${name}, this is value: ${value}`
    ); */

    const target = event.target;
    const value = target.type === "checkbox" ? target.checked : target.value;
    const name = event.target.name;
    console.log(target, value, name);

    this.setState(
      {
        [name]: value,
      },
      this.filterRooms
    );
  };

  filterRooms = () => { 
    let {
      rooms,
      type,
      IsAvailable,
      price,
      minSize,
      maxSize,
      gym,
      bar,
    } = this.state;

    // all the room
    let tempRooms = [...rooms];

    // transform value
    IsAvailable = parseInt(IsAvailable);
    price = parseInt(price);

    // filter by type
    if (type !== "all") {
      tempRooms = tempRooms.filter((room) => room.type === type);
    }

    // filter by IsAvailable
    if (IsAvailable !== 1) {
      tempRooms = tempRooms.filter((room) => room.IsAvailable >= IsAvailable);
    }

    // filter by price
    tempRooms = tempRooms.filter((room) => room.price <= price);

    // filter bt size
    tempRooms = tempRooms.filter(
      (room) => room.size >= minSize && room.size <= maxSize
    );

    // filter by gym
    if (gym) {
      tempRooms = tempRooms.filter((room) => room.gym === true);
    }

    // filter by bar
    if (bar) {
      tempRooms = tempRooms.filter((room) => room.bar === true);
    }

    // change state
    this.setState({
      sortedRooms: tempRooms,
    });
  };

  render() {
    return (
      <RoomContext.Provider
        value={{
          ...this.state,
          getRoom: this.getRoom,
          handleChange: this.handleChange,
        }}
      >
        {this.props.children}
      </RoomContext.Provider>
    );
  }
}

const RoomConsumer = RoomContext.Consumer;

export function withRoomConsumer(Component) {
  return function ConsumerWrapper(props) {
    return (
      <RoomConsumer>
        {(value) => <Component {...props} context={value} />}
      </RoomConsumer>
    );
  };
}

export { RoomProvider, RoomConsumer, RoomContext };
