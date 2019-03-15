import React, { Component } from "react";
import history from "./history";
import { Button } from "react-bootstrap";
import "./QueryForm.css";

class QueryForm extends Component {
  render() {
    return (
      <div className="query">
        <Button
          className="button-map"
          bsStyle="dark"
          onClick={() => history.push("/")}
        >
          Map
        </Button>
        <div />
      </div>
    );
  }
}

export default QueryForm;
