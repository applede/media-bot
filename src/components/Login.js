import React from 'react';
import { Input, ButtonInput, Panel } from 'react-bootstrap';

export default class Login extends React.Component {
  state = {
    disabled: true,
    style: null
  }

  validationState = () => {
    let length = this.refs.input.getValue().length;
    let style = 'danger';

    if (length > 10) { style = 'success'; }
    else if (length > 5) { style = 'warning'; }

    let disabled = style !== 'success';

    return { style, disabled };
  }

  handleChange = () => {
    this.setState( this.validationState() );
  }

  render() {
    return (
      <div className='loginPanel'>
        <form>
          <Input type='text' label='Username' placeholder='Enter text' ref="input" onChange={this.handleChange} />
          <Input type='password' label='Password' />
          <ButtonInput type="submit" value="Login" bsStyle={this.state.style} bsSize="large" disabled={this.state.disabled} />
        </form>
      </div>
    );
  }
}
