import React from 'react';

const ItemDetail = ({item}) => {
  // debugger
  return (
    <div className='item-detail'>
      <h3>{item.name}</h3>
      <p>Happiness: {item.happiness}</p>
      <p>Price: ${item.price}</p>
    </div>
  );
}


export default ItemDetail;
