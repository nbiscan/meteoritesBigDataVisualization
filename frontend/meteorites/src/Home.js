import React, { Component } from "react";
import { Map, TileLayer, Marker, Popup, Polygon } from "react-leaflet";
import "leaflet/dist/leaflet.css";
import L from "leaflet";
import icon from "leaflet/dist/images/marker-icon.png";
import iconShadow from "leaflet/dist/images/marker-shadow.png";
import testMarkers from "./testMarkers";
import { Button } from "react-bootstrap";
import "./Home.css";
import QueryForm from "./QueryForm";
import ImportData from "./ImportData";
import SelectDataset from "./SelectDataset";
import { getRandomColor } from "./services";

let DefaultIcon = L.icon({
  iconUrl: icon,
  shadowUrl: iconShadow,
  iconSize: [26, 40],
  iconAnchor: [13, 40],
  popupAnchor: [0, -40]
});
L.Marker.prototype.options.icon = DefaultIcon;

export default class Home extends Component {
  constructor(props) {
    super(props);
    this.state = {
      zoom: 3,
      serverMarkers: testMarkers,
      queryResult: [],
      testMarkers,
      currentLocation: null,
      showLocation: false,
      showPage: "MAP",
      headline: "",
      dataverse: localStorage.getItem("dataverse"),
      dataset: localStorage.getItem("dataset")
    };
    this.click = this.click.bind(this);
  }

  componentDidMount() {
    var tmpMarkers = [];

    window.navigator.geolocation.getCurrentPosition(position => {
      this.setState({
        currentLocation: [position.coords.latitude, position.coords.longitude]
      });
    });

    fetch(`http://localhost:19002/query/service`, {
      method: "POST",
      body: `select geometry from ${this.state.dataverse}.${
        this.state.dataset
      };`
    })
      .then(res => res.json())
      .then(response => {
        if (response.status !== "success") {
          alert("Error fetching the data");
          return;
        }

        this.setState({
          queryResult: response.results
        });

        // response.results.forEach(meteorite => {
        //   var metYear = meteorite.year
        //     ? `${meteorite.year.split("-")[0]}.`
        //     : "unknown";
        //   var metMass = meteorite.mass
        //     ? `${meteorite.mass.split("-")[0]} g`
        //     : "unknown";
        //   tmpMarkers.push({
        //     name: meteorite.name,
        //     year: metYear,
        //     mass: metMass,
        //     latLng: meteorite.geolocation
        //       ? [
        //           meteorite.geolocation.coordinates[1],
        //           meteorite.geolocation.coordinates[0]
        //         ]
        //       : undefined
        //   });
        // });
        // this.setState({
        //   serverMarkers: tmpMarkers
        // });
      });
  }

  click(text, attribute, operation) {
    var tmpMarkers = [];

    fetch(`http://localhost:19002/query/service`, {
      method: "POST",
      body: `select name, geolocation, year, mass from ${
        this.state.dataverse
      }.${
        this.state.dataset
      } where ${attribute.toLowerCase()} ${operation} "%${text}%";`
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
          serverMarkers: tmpMarkers,
          headline: text === "" ? "" : `${attribute}: ${text}`
        });
      });

    if (text === "") {
      document.getElementsByClassName("form")[0].value = "";
    }

    this.setState({
      showPage: "MAP"
    });
  }

  returnToMap = () => {
    this.setState({ showPage: "MAP" });
  };

  returnAndRefresh = () => {
    window.location.reload();
  };

  renderMap = () => (
    <div>
      <div className="background">
        <div className="input">
          <Button
            className="query-btn"
            bsStyle="dark"
            onClick={() => this.setState({ showPage: "QUERY" })}
          >
            New query
          </Button>
          {this.state.currentLocation && this.state.showLocation && (
            <div className="btn">
              <Button
                bsStyle="secondary"
                onClick={() =>
                  this.setState({
                    showLocation: false
                  })
                }
              >
                Hide current location
              </Button>
            </div>
          )}
          {this.state.currentLocation && !this.state.showLocation && (
            <div className="btn">
              <Button
                bsStyle="secondary"
                onClick={() =>
                  this.setState({
                    showLocation: true
                  })
                }
              >
                Show current location
              </Button>
            </div>
          )}
          <h3>{localStorage.getItem("dataset")}</h3>
          <Button
            onClick={() => this.setState({ showPage: "SELECT" })}
            className="import-data"
            bsStyle="dark"
          >
            Select active dataset
          </Button>
          <Button
            onClick={() => this.setState({ showPage: "IMPORT" })}
            className="import-data"
            bsStyle="dark"
          >
            Import data
          </Button>
        </div>
      </div>
      <Map
        center={this.state.testMarkers[0].latLng}
        zoom={this.state.zoom}
        minZoom={3}
      >
        <TileLayer
          attribution='&amp;copy <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
        />
        {this.state.currentLocation && this.state.showLocation && (
          <Marker position={this.state.currentLocation}>
            <Popup>
              <p>Your current location</p>
            </Popup>
          </Marker>
        )}
        {this.state.queryResult.map((markers, i) => {
          console.log(markers.geometry.coordinates);
          return (
            <Polygon
              key={i}
              color={getRandomColor()}
              positions={markers.geometry.coordinates}
            />
          );
        })}
      </Map>
    </div>
  );

  render() {
    switch (this.state.showPage) {
      case "MAP":
        return this.renderMap();
      case "QUERY":
        return <QueryForm return={this.returnToMap} passQuery={this.click} />;
      case "IMPORT":
        return <ImportData return={this.returnToMap} />;
      case "SELECT":
        return <SelectDataset return={this.returnAndRefresh} />;
      default:
        return this.renderMap();
    }
  }
}
