import React, { Component } from "react";
import { Map, TileLayer, Marker, Popup } from "react-leaflet";
import "leaflet/dist/leaflet.css";
import L from "leaflet";
import icon from "leaflet/dist/images/marker-icon.png";
import iconShadow from "leaflet/dist/images/marker-shadow.png";
import testMarkers from "./testMarkers";
import { Button } from "react-bootstrap";
import "./App.css";

let DefaultIcon = L.icon({
  iconUrl: icon,
  shadowUrl: iconShadow,
  iconSize: [26, 40],
  iconAnchor: [13, 40],
  popupAnchor: [0, -40]
});
L.Marker.prototype.options.icon = DefaultIcon;

export default class App extends Component {
  constructor(props) {
    super(props);
    // this.ws = new WebSocket("ws://localhost:9000/ws");
    this.state = {
      zoom: 4,
      serverMarkers: testMarkers,
      queryResult: [],
      testMarkers,
      currentLocation: [0, 0]
    };
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
      body: `select name, geolocation, year, mass from meteorites.meteorites_ds;`
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
      <div>
        <div className="background">
          <div className="input">
            <input
              className="form"
              placeholder="Enter full name or segment (please include capitalization)"
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
              <Button onClick={() => this.click(this.text.value)}>
                Search
              </Button>
            </div>
            <Button onClick={() => this.click("")}>Show all</Button>
          </div>
        </div>
        <Map center={this.state.serverMarkers[0].latLng} zoom={this.state.zoom}>
          <TileLayer
            attribution='&amp;copy <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
            url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          />
          <Marker position={this.state.currentLocation}>
            <Popup>
              <p>Your current location</p>
            </Popup>
          </Marker>
          {this.state.serverMarkers.map(
            (marker, i) =>
              marker.latLng && (
                <Marker key={i} position={marker.latLng}>
                  <Popup>
                    <p>Name: {marker.name}</p>
                    <p>Year: {marker.year}</p>
                    <p>Mass: {marker.mass}</p>
                  </Popup>
                </Marker>
              )
          )}
        </Map>
      </div>
    );
  }
}
