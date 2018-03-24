import React from 'react';

class Weather extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      currentLocation: [],
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

    xhr.onreadystatechange = function() {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          this.setState({
            temperature: xhr.responseText.main.temp,
            city: xhr.responseText.name,
          });
        }
      }
    };


    console.log(position.coords.latitude, position.coords.longitude);
  }

  render() {
    return (
      ""
    );
  }
}

export default Weather;
