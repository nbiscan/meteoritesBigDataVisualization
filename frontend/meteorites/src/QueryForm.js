import React, { Component } from "react";
import history from "./history";
import { Button } from "react-bootstrap";
import "./QueryForm.css";
import ImportData from "./ImportData";

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

  click(text) {
    var tmpMarkers = [];

    fetch(`http://localhost:19002/query/service`, {
      method: "POST",
      body: `select name, geolocation, year, mass from meteorites.meteorites_ds where name like "%${text}%";`
    })
      .then(res => res.json())
      .then(response => {
        this.setState({
          queryResult: response.results
        });

        response.results.forEach(meteorite => {
          var metYear = meteorite.year
            ? `${meteorite.year.split("-")[0]}.`
            : "unknown";
          var metMass = meteorite.mass
            ? `${meteorite.mass.split("-")[0]} g`
            : "unknown";
          tmpMarkers.push({
            name: meteorite.name,
            year: metYear,
            mass: metMass,
            latLng: meteorite.geolocation
              ? [
                  meteorite.geolocation.coordinates[1],
                  meteorite.geolocation.coordinates[0]
                ]
              : undefined
          });
        });
        this.setState({
          serverMarkers: tmpMarkers
        });
      });

    if (text === "") {
      document.getElementsByClassName("form")[0].value = "";
    }
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
              this.click(this.text.value);
            }
          }}
        />
        <div className="btn">
          <Button
            bsStyle="secondary"
            onClick={() => this.click(this.text.value)}
          >
            Search
          </Button>
        </div>
        <Button bsStyle="secondary" onClick={() => this.click("")}>
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
