import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Tabs from './tabs';

document.addEventListener("DOMContentLoaded", ()=>{
  const root = document.getElementById('root');
  const content = ['first','second','third'];
  ReactDOM.render(
    <div>
    <Clock />
    <Tabs title={['one', 'two', 'three']} content={content} />
    </div>
    , root);
});
//
