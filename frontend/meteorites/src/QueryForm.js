import React, { Component } from "react";
import { Button } from "react-bootstrap";
import "./QueryForm.css";
import Select from "react-select";

const scaryAnimals = [
  { label: "Name", value: "NAME" },
  { label: "Year", value: "YEAR" },
  { label: "Mass", value: "MASS" }
];
class QueryForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      serverMarkers: [],
      queryResult: [],
      currentLocation: null,
      showLocation: true,
      selectedOption: "NAME"
    };
  }

  render() {
    return (
      <div className="query">
        <Button
          className="button-map"
          bsStyle="dark"
          onClick={() => this.props.return()}
        >
          Map
        </Button>
        <div className="content">
          <div className="select">
            <Select
              options={scaryAnimals}
              onChange={opt => this.setState({ selectedOption: opt.value })}
            />
          </div>
          <br />
          <input
            className="form"
            placeholder="Enter full name or segment"
            ref={input => {
              this.text = input;
            }}
            onKeyPress={event => {
              if (event.key === "Enter") {
                this.props.passQuery(
                  this.text.value,
                  this.state.selectedOption
                );
              }
            }}
          />
          <br />
          <div className="btn">
            <Button
              bsStyle="secondary"
              onClick={() =>
                this.props.passQuery(this.text.value, this.state.selectedOption)
              }
            >
              Search
            </Button>
            <Button
              bsStyle="secondary"
              onClick={() => this.props.passQuery("", "NAME")}
            >
              Cancel query
            </Button>
          </div>
        </div>
      </div>
    );
  }
}

export default QueryForm;
