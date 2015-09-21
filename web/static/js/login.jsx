import React, { Component } from 'react';
import { Link } from 'react-router';
import { Panel, Input, ButtonInput, Row, Col } from 'react-bootstrap';

const panelStyles = { maxWidth: 400, margin: '0 auto' };
const centerStyle = { width: 200, margin: '20px auto -20px' };

export class Login extends Component {
  render() {
    return (
      <Panel style={panelStyles}>
        <form onSubmit={this._onSubmit}>
          <Input ref="username" type="text" placeholder="Username" required autofocus />
          <Input ref="password" type="password" placeholder="Password" required />
          <div style={centerStyle}>
            <ButtonInput type="submit" value="Log in" bsStyle='primary' block />
          </div>
        </form>
      </Panel>
    );
  }
}

export default Login;
