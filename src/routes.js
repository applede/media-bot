import React from 'react';
import {Route} from 'react-router';

import Main from 'components/main';
import Example from 'components/example';

const routes = (
  <Route handler={Main}>
    <Route name='movie' handler={Example}/>
    <Route name='series' handler={Example}/>
    <Route name='porn' handler={Example}/>
    <Route name='etc' handler={Example}/>
  </Route>
);

export default routes;
