import React, { Component } from "react";
import { Button } from "react-bootstrap";
import "./QueryForm.css";
import Select from "react-select";

const attributes = [
  { label: "Name", value: "NAME" },
  { label: "Year", value: "YEAR" },
  { label: "Mass", value: "MASS" }
];

const sqlOperations = [
  { label: "LIKE", value: "like" },
  { label: ">", value: ">" },
  { label: "<", value: "<" }
];

class QueryForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      serverMarkers: [],
      queryResult: [],
      currentLocation: null,
      showLocation: true,
      selectedAttrubute: "NAME",
      selectedOption: "LIKE"
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
              options={attributes}
              onChange={opt => this.setState({ selectedAttrubute: opt.value })}
            />
          </div>
          <br />
          <div className="select">
            <Select
              options={sqlOperations}
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
                  this.state.selectedAttrubute,
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
                this.props.passQuery(
                  this.text.value,
                  this.state.selectedAttrubute,
                  this.state.selectedOption
                )
              }
            >
              Search
            </Button>
            <Button
              bsStyle="secondary"
              onClick={() => this.props.passQuery("", "NAME", "LIKE")}
            >
              Remove filters
            </Button>
          </div>
        </div>
      </div>
    );
  }
}

export default QueryForm;
