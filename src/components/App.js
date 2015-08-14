import React from 'react';
import { Navbar, Nav, DropdownButton, MenuItem } from 'react-bootstrap';
import { Link } from 'react-router';
import { NavItemLink } from 'react-router-1-bootstrap';

export default class App extends React.Component {
  render() {
    return (
      <div className="nav">
        <Navbar brand={<Link to='/'>미디어 봇</Link>}>
          <Nav>
            <NavItemLink to='login'>Login</NavItemLink>
          </Nav>
        </Navbar>
        {this.props.children}
      </div>
    );
  }
}
