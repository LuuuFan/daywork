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
    const t = this.state.time.toTimeString().split(" ");
    // console.log(t);
    return (
      <div>
        <h1>Clock</h1>
        <div className='clock'>
          <p>
            <span>Time:</span>
            <span>{ t[0] } { t[2].slice(1,4) }</span>
          </p>
          <p>
            <span>Date:</span>
            <span>{ this.state.time.toDateString() }</span>
          </p>
        </div>
      </div>
    );
  }
}



export default Clock;
