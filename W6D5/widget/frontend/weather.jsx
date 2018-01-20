import React from 'react';

class Weather extends React.Component {
  constructor() {
    super();
    this.state = {weather: ''};
    // this.getCity = this.getCity.bind(this);
  }

  componentDidMount(){
    navigator.geolocation.getCurrentPosition((pos)=>{
      const url = `http://api.openweathermap.org/data/2.5/weather?lat=${pos.coords.latitude}&lon=${pos.coords.longitude}&appid=be182788a8d4e2a8a2a1803c42eea32c`
      console.log(url);
      this.getCity(url);
    });
  }

  getCity(url){
    // console.log('call getCity');
    var xhr = new XMLHttpRequest();
    // debugger
    xhr.onreadystatechange = () => {
      if (xhr.readyState === 4 && xhr.status === 200) {
        console.log(JSON.parse(xhr.response));
        this.setState({weather: JSON.parse(xhr.response)});
      }
    }
    xhr.open('GET', url, true);
    xhr.send();
  }

  render () {
    // debugger
    let temp = this.state.weather ? this.state.weather.main.temp : 'loading...'
    return (
      <div>
        <h1>Weather</h1>
        <div className="weather">
          <div className="">
            <p>{this.state.weather.name}</p>
            <p>
              <span>{temp}</span>
              <span> degrees</span>
            </p>
          </div>
        </div>
      </div>
    );
  }
}

export default Weather;
