import React, { Component } from "react";
import { Button } from "react-bootstrap";
import "./QueryForm.css";

class QueryForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      serverMarkers: [],
      queryResult: [],
      currentLocation: null,
      showLocation: true
    };
  }

  render() {
    return (
      <div className="background">
        <input
          className="form"
          placeholder="Enter full name or segment"
          ref={input => {
            this.text = input;
          }}
          onKeyPress={event => {
            if (event.key === "Enter") {
              this.props.passQuery(this.text.value);
            }
          }}
        />
        <div className="btn">
          <Button
            bsStyle="secondary"
            onClick={() => this.props.passQuery(this.text.value)}
          >
            Search
          </Button>
        </div>
        <Button bsStyle="secondary" onClick={() => this.props.passQuery("")}>
          Cancel query
        </Button>
        <Button
          className="button-map"
          bsStyle="dark"
          onClick={() => this.props.return()}
        >
          Map
        </Button>

        <div />
      </div>
    );
  }
}

export default QueryForm;
