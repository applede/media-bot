import React from 'react';
import {RouteHandler, Link} from 'react-router';
import {Nav, ListGroup, Navbar} from 'react-bootstrap';
import {NavItemLink, ButtonLink, ListGroupItemLink} from 'react-router-bootstrap';
require('../styles/main.less');

class Main extends React.Component {
  render() {
    return (
      <div>
        <Navbar brand={<a href="#">미디어봇</a>}>
          <Nav>
            <NavItemLink to="movie">
              영화
            </NavItemLink>
            <NavItemLink to="series">
              시리즈
            </NavItemLink>
            <NavItemLink to="porn">
              야동
            </NavItemLink>
            <NavItemLink to="etc">
              기타
            </NavItemLink>
          </Nav>
        </Navbar>
        <RouteHandler />
      </div>
    );
  }
}

export default Main;
