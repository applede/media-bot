import React, { Component } from 'react';
import {Link} from 'react-router';

export class Login extends Component {
  render() {
    var errors = <div></div>;
    return (
      <div>
        {errors}

        <div className="row">
          <form className="form-signin" onSubmit={this._onSubmit}>
            <h2 className="form-signin-heading">Please log in below</h2>

            <label htmlFor="inputEmail" className="sr-only">Email address</label>
            <input ref="email" type="email" id="inputEmail" className="form-control" placeholder="Email address" required autofocus />

            <label htmlFor="inputPassword" className="sr-only">Password</label>
            <input ref="password" type="password" id="inputPassword" className="form-control" placeholder="Password" required />

            <button className="btn btn-lg btn-primary btn-block" type="submit">Log in</button>

            <div className="row">
            {
              // <Link to="forgot_password">Forgot password</Link>-->
            }
            </div>

          </form>
        </div>
      </div>
    );
  }
}

export default Login;
