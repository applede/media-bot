import React, { Component } from 'react';
import Login from './login.jsx';

export class App extends Component {
  render() {
    return (
      <div>
        <Login />
      </div>
    );
  }
}

React.render(<App />, document.getElementById('root'));
