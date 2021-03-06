import React, { Component } from "react";
import { Router, Route, Switch } from "react-router-dom";
import Home from "./Home";
import ImportData from "./ImportData";
import SelectDataset from "./SelectDataset";
import history from "./history";

class App extends Component {
  render() {
    return (
      <Router history={history}>
        <div>
          <Switch>
            <Route path="/" exact component={Home} />
            <Route path="/import" exact component={ImportData} />
            <Route path="/select" exact component={SelectDataset} />
          </Switch>
        </div>
      </Router>
    );
  }
}

export default App;
