import React from "react";
import { useContext } from "react";

// import context
import { RoomContext } from "../../Context/Context";

// import components
import Title from "../Title/Title";

// get all unique values
const getUnique = (items, value) => {
  return [...new Set(items.map((item) => item[value]))];
};

export default function RoomFilter({ rooms }) {
  const context = useContext(RoomContext);

  const {
    handleChange,
    type,
    capacity,
    price,
    minPrice,
    maxPrice,
    minSize,
    maxSize,
    gym,
    bar,
  } = context;

  // get unique types
  let types = getUnique(rooms, "type");
  // add all
  types = ["all", ...types];
  // map to jsx
  types = types.map((item, index) => {
    return (
      <option value={item} key={index}>
        {item}
      </option>
    );
  });

  // room guests filtering functionality
  let people = getUnique(rooms, "capacity");
  people = people.map((item, index) => {
    return (
      <option key={index} value={item}>
        {item}
      </option>
    );
  });

  return (
    <section className="filter-container">
      <Title title="search rooms" />

      <form className="filter-form">
        {/* select type start */}
        <div className="form-group select-box">
          <label htmlFor="type" className="label">rooms type</label>
          <select
            name="type"
            id="type"
            value={type}
            className="form-control select"
            onChange={handleChange}
          >
            {/* <option value="single">single</option> */}
            {types}
          </select>
        </div>
        {/* select type end */}

        {/* guests type start */}
        <div className="form-group">
          <label htmlFor="capacity">guests</label>
          <select
            name="capacity"
            id="capacity"
            value={capacity}
            className="form-control select"
            onChange={handleChange}
          >
            {/* <option value="single">single</option> */}
            {people}
          </select>
        </div>
        {/* guests type end */}

        {/* room price start */}
        <div className="form-group">
          <label htmlFor="price">room price ${price}</label>

          <input
            type="range"
            name="price"
            min={minPrice}
            max={maxPrice}
            id="price"
            value={price}
            onChange={handleChange}
            className="form-control"
          />
        </div>
        {/* room price end */}

        {/* size start */}
        <div className="form-group">
          <label htmlFor="size">room size</label>

          <div className="size-inputs">
            <input
              type="number"
              name="minSize"
              id="size"
              value={minSize}
              onChange={handleChange}
              className="size-input"
            />
            <input
              type="number"
              name="maxSize"
              id="size"
              value={maxSize}
              onChange={handleChange}
              className="size-input"
            />
          </div>
        </div>
        {/* size end */}

        {/* extras start */}
        <div className="form-group">
          {/* gym checked */}
          <div className="single-extra">
            <input
              type="checkbox"
              name="gym"
              id="gym"
              checked={gym}
              onChange={handleChange}
            />
            <label htmlFor="gym">gym</label>
          </div>

          {/* bar checked */}
          <div className="single-extra">
            <input
              type="checkbox"
              name="bar"
              id="bar"
              checked={bar}
              onChange={handleChange}
            />
            <label htmlFor="bar">bar</label>
          </div>
        </div>
        {/* extras end */}
      </form>
    </section>
  );
}
