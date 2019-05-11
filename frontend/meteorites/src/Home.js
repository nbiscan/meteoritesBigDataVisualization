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
import SelectDataset from "./SelectDataset";
import { Link } from "react-router-dom";
// import { getRandomColor } from "./services";

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
      serverMarkers: [],
      queryResult: [],
      testMarkers,
      currentLocation: null,
      showLocation: false,
      showPage: "MAP",
      headline: "",
      dataverse: localStorage.getItem("dataverse"),
      dataset: localStorage.getItem("dataset")
    };
    // this.click = this.click.bind(this);
  }

  componentDidMount() {
    var tmpCoordinates = [];
    var tmpMarkers = [];

    window.navigator.geolocation.getCurrentPosition(position => {
      this.setState({
        currentLocation: [position.coords.latitude, position.coords.longitude]
      });
    });

    fetch(`http://localhost:19002/query/service`, {
      method: "POST",
      body: `select value ${this.state.dataset} from ${this.state.dataverse}.${
        this.state.dataset
      };`
    })
      .then(res => res.json())
      .then(response => {
        if (response.status !== "success") {
          alert("Error fetching the data");
          return;
        }

        response.results.forEach(result => {
          tmpCoordinates = [];
          const coordinates =
            result.geometry.type === "Polygon"
              ? result.geometry.coordinates[0]
              : result.geometry.coordinates;

          coordinates.forEach(coo => {
            tmpCoordinates.push(coo.reverse());
          });

          tmpMarkers.push(tmpCoordinates);
        });

        this.setState({
          serverMarkers: tmpMarkers
        });
      });
  }

  click(text, attribute, operation) {}

  returnToMap = () => {
    this.setState({ showPage: "MAP" });
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
          <Link className="btn btn-dark import-data" to="/select">
            Select active dataset
          </Link>
          <Link className="btn btn-dark import-data" to="/import">
            Import data
          </Link>
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
        <Polygon color="darkblue" positions={this.state.serverMarkers}>
          <Popup>
            <p>Polygon</p>
          </Popup>
        </Polygon>
      </Map>
    </div>
  );

  render() {
    switch (this.state.showPage) {
      case "MAP":
        return this.renderMap();
      case "QUERY":
        return <QueryForm return={this.returnToMap} passQuery={this.click} />;
      default:
        return this.renderMap();
    }
  }
}
