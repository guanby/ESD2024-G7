import details1 from "../assets/img/jpg/details-1.jpg";
import img1 from "../assets/img/jpg/room-1.jpg";
import img2 from "../assets/img/jpg/room-1.jpg";
import img3 from "../assets/img/jpg/room-1.jpg";

const data = [
  {
    sys: {
      id: "1",
    },
    fields: {
      name: "deluxe twin",
      slug: "deluxe-twin",
      type: "twin",
      price: 199,
      size: 450,
      capacity: 2,
      bar: false,
      gym: true,
      featured: true,
      description:
        "The Deluxe Twin room is a haven of sophistication and comfort, perfect for those seeking a stylish yet cozy retreat. Featuring two luxurious twin beds adorned with premium linens, guests are guaranteed a restful night's sleep. The room is thoughtfully designed with modern amenities and tasteful decor, creating a serene ambiance for relaxation or work. The en-suite bathroom boasts elegant marble finishes and deluxe toiletries, offering a touch of luxury. With amenities like a flat-screen TV, minibar, and coffee-making facilities, guests can indulge in convenience and relaxation throughout their stay. Whether traveling for business or leisure, the Deluxe Twin room provides an inviting sanctuary for guests to unwind and recharge.",
      extras: [
        "Two luxurious twin beds with premium linens for a restful night's sleep",
        "Elegant marble-finished en-suite bathroom with deluxe toiletries for a touch of luxury",
        "Flat-screen TV with a selection of channels for entertainment",
        "Minibar stocked with a variety of beverages for your enjoyment",
        "Coffee and tea-making facilities provided for your convenience",
        "Safe available in the room for securing your valuables",
        "High-speed internet access to stay connected throughout your stay",
      ],
      images: [
        {
          fields: {
            file: {
              url: img1,
            },
          },
        },
        {
          fields: {
            file: {
              url: details1,
            },
          },
        },
        {
          fields: {
            file: {
              url: details1,
            },
          },
        },
        {
          fields: {
            file: {
              url: details1,
            },
          },
        },
      ],
    },
  },
  {
    sys: {
      id: "2",
    },
    fields: {
      name: "suite room",
      slug: "suite-room",
      type: "family",
      price: 400,
      size: 650,
      capacity: 4,
      bar: true,
      gym: false,
      featured: true,
      description:
        "The Suite room is a haven of sophistication and comfort, perfect for those seeking a stylish yet cozy retreat. Featuring two luxurious twin beds adorned with premium linens, guests are guaranteed a restful night's sleep. The room is thoughtfully designed with modern amenities and tasteful decor, creating a serene ambiance for relaxation or work. The en-suite bathroom boasts elegant marble finishes and deluxe toiletries, offering a touch of luxury. With amenities like a flat-screen TV, minibar, and coffee-making facilities, guests can indulge in convenience and relaxation throughout their stay. Whether traveling for business or leisure, the Deluxe Twin room provides an inviting sanctuary for guests to unwind and recharge.",
      extras: [
        "Two luxurious twin beds with premium linens for a restful night's sleep",
        "Elegant marble-finished en-suite bathroom with deluxe toiletries for a touch of luxury",
        "Flat-screen TV with a selection of channels for entertainment",
        "Minibar stocked with a variety of beverages for your enjoyment",
        "Coffee and tea-making facilities provided for your convenience",
        "Safe available in the room for securing your valuables",
        "High-speed internet access to stay connected throughout your stay",
      ],
      images: [
        {
          fields: {
            file: {
              url: img2,
            },
          },
        },
        {
          fields: {
            file: {
              url: details1,
            },
          },
        },
        {
          fields: {
            file: {
              url: details1,
            },
          },
        },
        {
          fields: {
            file: {
              url: details1,
            },
          },
        },
      ],
    },
  },
  {
    sys: {
      id: "3",
    },
    fields: {
      name: "Penthouse",
      slug: "penthouse-room",
      type: "penthouse",
      price: 600,
      size: 900,
      capacity: 6,
      bar: true,
      gym: true,
      featured: true,
      description:
        "The Penthouse room is a haven of sophistication and comfort, perfect for those seeking a stylish yet cozy retreat. Featuring two luxurious twin beds adorned with premium linens, guests are guaranteed a restful night's sleep. The room is thoughtfully designed with modern amenities and tasteful decor, creating a serene ambiance for relaxation or work. The en-suite bathroom boasts elegant marble finishes and deluxe toiletries, offering a touch of luxury. With amenities like a flat-screen TV, minibar, and coffee-making facilities, guests can indulge in convenience and relaxation throughout their stay. Whether traveling for business or leisure, the Deluxe Twin room provides an inviting sanctuary for guests to unwind and recharge.",
      extras: [
        "Two luxurious twin beds with premium linens for a restful night's sleep",
        "Elegant marble-finished en-suite bathroom with deluxe toiletries for a touch of luxury",
        "Flat-screen TV with a selection of channels for entertainment",
        "Minibar stocked with a variety of beverages for your enjoyment",
        "Coffee and tea-making facilities provided for your convenience",
        "Safe available in the room for securing your valuables",
        "High-speed internet access to stay connected throughout your stay",
      ],
      images: [
        {
          fields: {
            file: {
              url: img3,
            },
          },
        },
        {
          fields: {
            file: {
              url: details1,
            },
          },
        },
        {
          fields: {
            file: {
              url: details1,
            },
          },
        },
        {
          fields: {
            file: {
              url: details1,
            },
          },
        },
      ],
    },
  },
];

export default data;
