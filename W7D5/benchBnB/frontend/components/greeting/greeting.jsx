import React from 'react';
import { Link } from 'react-router-dom';

const Greeting = (props) => {
  const currentUser = this.props.session.currentUser;
  if (currentUser) {
    return (
      <div>
        <h2> Welcome, {currentUser.username} </h2>
        <button>Logout</button>
      </div>
    );
  } else {
    return (
      <div>
        <Link to="/signup">Sign Up</Link>
        <Link to="/login">Sign In</Link>
      </div>
    );
  }
};

export default Greeting;
