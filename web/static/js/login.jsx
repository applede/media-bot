import React, { Component } from 'react';
import { Link } from 'react-router';
import { Panel, Input, ButtonInput, Row, Col } from 'react-bootstrap';

const panelStyles = { maxWidth: 400, margin: '0 auto' };

export class Login extends Component {
  render() {
    var errors = <div></div>;
    return (
      <Panel style={panelStyles}>
        {errors}

        <div>
          <form onSubmit={this._onSubmit}>
            <h2></h2>
            <Input ref="username" type="text" placeholder="Username" required autofocus />
            <Input ref="password" type="password" placeholder="Password" required />
            <Row>
              <Col xs={4} xsOffset={4}>
                <ButtonInput type="submit" value="Log in" bsStyle='primary' block />
              </Col>
            </Row>
          </form>
        </div>
      </Panel>
    );
  }
}

export default Login;
