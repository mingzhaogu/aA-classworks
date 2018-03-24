import React from 'react';

class Weather extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      currentLocation: ['abc'],
      temperature: 0,
      city: "",
    };
    this.getGeoLocation();
  }

  getGeoLocation() {
    if ("geolocation" in navigator) {
      console.log('geo location is here ');
      navigator.geolocation.getCurrentPosition(this.handlePosition);
    } else {
      console.log('geo location is not here ');
    }
  }

  handlePosition(position) {
    let xhr = new XMLHttpRequest();

    // xhr.onreadystatechange = function() {
    //   if (xhr.readyState === XMLHttpRequest.DONE) {
    //     if (xhr.status === 200) {
    //       this.setState({
    //         temperature: xhr.responseText.main.temp,
    //         city: xhr.responseText.name,
    //       });
    //       console.log(this.state.temperature)
    //       console.log(this.state.city)
    //     }
    //   }
    // };

    this.setState({currentLocation: [position.coords.latitude, position.coords.longitude]});
  }

  render() {
    return (
      <div>{this.state.currentLocation}</div>
    );
  }
}

export default Weather;
