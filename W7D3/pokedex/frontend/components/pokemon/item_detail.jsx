import React from 'react';

const ItemDetail = ({ item }) => {
  return (
    <section>
      <ul className="pokemon-item-detail">
        <li>{item.name}</li>
        <li>Happiness: {item.happiness}</li>
        <li>Price: {item.price}</li>
      </ul>
    </section>
  )
}

// <img src={item.image_url}/>
export default ItemDetail;
