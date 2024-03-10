import React from "react";

export default function Footer() {
  const year = new Date().getFullYear();

  return (
    <footer className="footer">
      <h2>Ondeh-Ondeh Hotel</h2>
      <p>
        &copy; <span>{year}</span> ondehondehhotel.com - All Rights Copyright
        Reserved To{" "}
        <a
          target="_blank"
          rel="noreferrer"
          href="https://github.com/guanby/ESD2024-G7"
        >
          Ondeh-Ondeh Hotel
        </a>
      </p>
    </footer>
  );
}
