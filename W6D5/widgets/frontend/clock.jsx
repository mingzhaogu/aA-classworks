import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      time: new Date(),
    };

    this.tick = this.tick.bind(this);
  }

  componentDidMount() {
    this.intervalId = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.intervalId);
  }

  tick() {
    this.setState({ time: new Date() });
  }

  render() {
    const { time } = this.state;
    return(
      <div className='clock'>

        <h1 className='clock-time'>
          <label>Time:</label>
          <label>{time.toLocaleTimeString('en-US')}</label>
        </h1>

        <h1 className='clock-date'>
          <label>Date:</label>
          <label>{time.toDateString()}</label>
        </h1>
      </div>
    );
  }
}

export default Clock;
