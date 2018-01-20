import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Tabs from './tabs';
import Weather from './weather';
import Autocomplete from './autocomplete';

document.addEventListener("DOMContentLoaded", ()=>{
  const root = document.getElementById('root');
  const nameList = ['luuuu', 'lu Fan', 'shasha', 'night'];
  const content = ['first','second','third'];
  ReactDOM.render(
    <div>
    <Clock />
    <Weather />
    <div className="interactive">
      <Tabs title={['one', 'two', 'three']} content={content} />
      <Autocomplete nameList={nameList} />
    </div>
    </div>
    , root);
});
//
