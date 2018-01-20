import React from 'react';

class Clock extends React.Component {
  constructor() {
    super();
    this.state = {time: new Date()};
  }

  componentDidMount(){
    setInterval(this.tick.bind(this), 1000);
  }

  tick(){
    this.setState({time: new Date()});
  }

  render(){
    // const seconds = this.state.time.getSeconds() > 10 ? this.state.time.getSeconds() : `0${this.state.time.getSeconds()}`;
    // const minutes = this.state.time.getMinutes() > 10 ? this.state.time.getMinutes() : `0${this.state.time.getMinutes()}`;
    // const hours = this.state.time.getHours() > 10 ? this.state.time.getHours() : `0${this.state.time.getHours()}`;
    const time = this.state.time.toUTCString().split(" ");



    return (
      <div>
        <h1>Clock</h1>
        <div className='clock'>
          <p>
            <span>Time:</span>
            <span>{ time[4] } : {time[5]}</span>
          </p>
          <p>
            <span>Date:</span>
            <span>{ time.slice(0,4).join(" ") }</span>
          </p>
        </div>
      </div>
    );
  }
}



export default Clock;
