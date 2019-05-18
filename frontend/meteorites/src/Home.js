import React, { Component } from "react";
import { Map, TileLayer, Popup, Polygon } from "react-leaflet";
import "leaflet/dist/leaflet.css";
import L from "leaflet";
import icon from "leaflet/dist/images/marker-icon.png";
import iconShadow from "leaflet/dist/images/marker-shadow.png";
import testMarkers from "./testMarkers";
import { Button } from "react-bootstrap";
import "./Home.css";
import QueryForm from "./QueryForm";
import { Link } from "react-router-dom";

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
      showLocation: false,
      showPage: "MAP",
      headline: "",
      dataverse: localStorage.getItem("dataverse"),
      dataset: localStorage.getItem("dataset"),
      selectedPolygons: [],
      loading: false,
      refresh: true
    };
  }

  componentDidMount() {
    var tmpCoordinates = [];
    var tmpMarkers = [];

    this.setState({ loading: true });

    fetch(`http://localhost:19002/query/service`, {
      method: "POST",
      body: `select value ${this.state.dataset} from ${this.state.dataverse}.${
        this.state.dataset
      };`
    })
      .then(res => res.json())
      .then(response => {
        if (response.status !== "success") {
          alert("Error fetching the data. Please try again.");
          return;
        }

        response.results.forEach(result => {
          tmpCoordinates = [];
          let coordinates = [];
          switch (result.geometry.type) {
            case "Polygon":
              coordinates = result.geometry.coordinates[0];
              break;
            case "LineString":
              coordinates = result.geometry.coordinates;
              break;
            case "Point":
              coordinates = [result.geometry.coordinates];
              break;
            default:
              coordinates = [result.geometry.coordinates];
          }
          coordinates.forEach(coo => {
            tmpCoordinates.push(coo.reverse());
          });

          tmpMarkers.push({
            coordinates: tmpCoordinates,
            properties: result.properties,
            geometry: result.geometry,
            selected: false
          });
        });

        this.setState({
          serverMarkers: tmpMarkers,
          loading: false
        });
      });
  }

  click(operation) {
    const dv = localStorage.getItem("dataverse");
    const ds = localStorage.getItem("dataset");
    fetch(`http://localhost:19002/query/service`, {
      method: "POST",
      body: `select value ${operation}(geometry) from ${dv}.${ds};`
    })
      .then(res => res.json())
      .then(response => {
        console.log(response.results);
      });
  }

  returnToMap = () => {
    this.setState({ showPage: "MAP" });
  };

  togglePolygon = id => {
    const idAttribute = localStorage.getItem("id").toString();
    if (!this.state.selectedPolygons.includes(id)) {
      this.setState({
        selectedPolygons: [...this.state.selectedPolygons, id]
      });
    } else {
      const tmp = this.state.selectedPolygons;
      var index = tmp.indexOf(id);
      if (index > -1) {
        tmp.splice(index, 1);
      }
      this.setState({
        selectedPolygons: tmp
      });
    }
    this.state.serverMarkers.forEach(marker => {
      if (marker.properties[idAttribute] === id) {
        marker.selected = !marker.selected;
        console.log(marker.selected);
      }
    });

    this.setState({
      refresh: !this.state.refresh
    });

    console.log(this.state.selectedPolygons);
  };

  clearSelections = () => {
    this.state.serverMarkers.forEach(marker => {
      marker.selected = false;
    });

    this.setState({
      selectedPolygons: [],
      refresh: !this.state.refresh
    });
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
          {this.state.selectedPolygons.length > 0 && (
            <Button
              className="query-btn"
              bsStyle="secondary"
              onClick={() => this.clearSelections()}
            >
              Clear selections
            </Button>
          )}
          {this.state.loading && <h3>Loading data for </h3>}
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
        {this.state.serverMarkers.map(polygon => (
          <Polygon
            onClick={() =>
              this.togglePolygon(
                polygon.properties[localStorage.getItem("id").toString()]
              )
            }
            color={polygon.selected ? "darkred" : "darkblue"}
            positions={polygon.coordinates}
          >
            {/* <Popup>
              <p>test</p>
            </Popup> */}
          </Polygon>
        ))}
      </Map>
    </div>
  );

  render() {
    switch (this.state.showPage) {
      case "MAP":
        return this.renderMap();
      case "QUERY":
        return (
          <QueryForm
            passQuery={this.click}
            dataset={this.state.dataset}
            dataverse={this.state.dataverse}
            return={this.returnToMap}
          />
        );
      default:
        return this.renderMap();
    }
  }
}
