import React from 'react';
import ReactDOM from 'react-dom';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";
import DApp from './DApp';
import * as serviceWorker from './serviceWorker';

function App() {
  return (
    <Router>
      <div>
        <ul>
          <li>
            <Link to="/">SimpleStorage</Link>
          </li>
        </ul>

        <hr />

        <Switch>
          <Route exact path="/">
            <DApp />
          </Route>
        </Switch>
      </div>
    </Router>
  );
}

ReactDOM.render(<App />, document.getElementById('root'));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: http://bit.ly/CRA-PWA
serviceWorker.unregister();
