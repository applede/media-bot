import React from 'react'
import { DefaultRoute, Route } from 'react-router'
import App from './components/App'
import Login from './components/Login'

export default (
  <Route name="app" component={App} path="/">
      <Route component={Login} path="login" />
  </Route>
)
