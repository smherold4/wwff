
import React from 'react';
import { Redirect } from 'react-router';
import { BrowserRouter, Match, Route, Link } from 'react-router-dom';

export default class LandingPage extends React.Component {
  
  constructor(props) {
    super(props);
  }
  
  render() {
    return (
      <h1>Hey WWFF People</h1>
    )
  }
  
}

