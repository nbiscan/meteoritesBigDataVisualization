import React, { Component } from "react";
import { Button } from "react-bootstrap";
import "./QueryForm.css";
import Select from "react-select";

const attributes = [
  { label: "Area", value: "st_area" },
  { label: "Dimension", value: "st_dimension" },
  { label: "Is simple?", value: "st_is_simple" },
  { label: "Is empty?", value: "st_is_empty" }
];

class QueryForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedAttrubute: "st_area"
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

          {/* <input
            className="form"
            placeholder="Enter full name or segment"
            ref={input => {
              this.text = input;
            }}
            onKeyPress={event => {
              if (event.key === "Enter") {
                this.props.passQuery(
                  this.state.selectedAttrubute,
                  this.props.dataverse,
                  this.props.dataset
                );
              }
            }}
          />
          <br /> */}
          <div className="btn">
            <Button
              bsStyle="dark"
              onClick={() =>
                this.props.passQuery(
                  this.state.selectedAttrubute,
                  this.props.dataverse,
                  this.props.dataset
                )
              }
            >
              Search
            </Button>
            <Button
              bsStyle="secondary"
              onClick={() =>
                this.props.passQuery(
                  "",
                  this.props.dataverse,
                  this.props.dataset
                )
              }
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
