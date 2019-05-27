import React, { Component } from "react";
import { Map, TileLayer, Popup, Polygon } from "react-leaflet";
import "leaflet/dist/leaflet.css";
import L from "leaflet";
import icon from "leaflet/dist/images/marker-icon.png";
import iconShadow from "leaflet/dist/images/marker-shadow.png";
import testMarkers from "./testMarkers";
import { Button } from "react-bootstrap";
import "./Home.css";
import { Link } from "react-router-dom";
import { ROOT_URL, attributes } from "./services";
import { isMobile } from "react-device-detect";
import Select from "react-select";

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
      headline: "",
      dataverse: localStorage.getItem("dataverse"),
      dataset: localStorage.getItem("dataset"),
      selectedPolygons: [],
      loading: false,
      refresh: true,
      showHeader: false,
      selectedAttrubute: []
    };
  }

  componentDidMount() {
    var tmpCoordinates = [];
    var tmpMarkers = [];

    this.setState({ loading: true });

    fetch(`http://${ROOT_URL}:19002/query/service`, {
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
    fetch(`http://${ROOT_URL}:19002/query/service`, {
      method: "POST",
      body: `select value ${operation}(geometry) from ${dv}.${ds};`
    })
      .then(res => res.json())
      .then(response => {
        console.log(response.results);
      });
  }

  togglePolygon = polygon => {
    const idAttribute = localStorage.getItem("id").toString();
    if (!this.state.selectedPolygons.includes(polygon)) {
      this.setState({
        selectedPolygons: [...this.state.selectedPolygons, polygon]
      });
    } else {
      const tmp = this.state.selectedPolygons;
      var index = tmp.indexOf(polygon);
      if (index > -1) {
        tmp.splice(index, 1);
      }
      this.setState({
        selectedPolygons: tmp
      });
    }
    this.state.serverMarkers.forEach(marker => {
      if (marker.properties[idAttribute] === polygon.properties[idAttribute]) {
        marker.selected = !marker.selected;
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

  sendIndividualRequest = operation => {
    // radi ali jos je hardkodirano samo

    operation = "st_distance";

    this.state.selectedPolygons.forEach(id => {});

    fetch(`http://${ROOT_URL}:19002/query/service`, {
      method: "POST",
      body: `${operation}(st_geom_from_geojson(${JSON.stringify(
        this.state.selectedPolygons[0].geometry
      )}), st_geom_from_geojson(${JSON.stringify(
        this.state.selectedPolygons[1].geometry
      )}));`
    })
      .then(res => res.json())
      .then(response => {
        console.log(response.results);
      });
  };

  renderMap = () => (
    <div class="whole-map">
      <div className="header">
        {this.state.selectedPolygons.length > 0 && (
          <div>
            <Button
              className="query-btn btn-light"
              onClick={() => this.clearSelections()}
            >
              Clear selection
            </Button>
            <Button
              className="query-btn btn-secondary"
              onClick={() => this.sendIndividualRequest()}
            >
              Send request
            </Button>
          </div>
        )}
        {this.state.loading && (
          <h3 className="title loading">Loading data for </h3>
        )}
        <h3 className="title">{localStorage.getItem("dataset")}</h3>
        <Link className="btn btn-dark import-data" to="/select">
          Select active dataset
        </Link>
        <Link className="btn btn-dark import-data" to="/import">
          Import data
        </Link>
        <div className="content">
          <div className="select">
            <Select
              options={attributes}
              onChange={opt => this.setState({ selectedAttrubute: opt.value })}
            />
          </div>
          <br />
          <div className="btn">
            <Button
              className="btn-dark"
              onClick={() => this.click(this.state.selectedAttrubute)}
            >
              Search
            </Button>
            <Button className="btn-secondary" onClick={() => this.click("")}>
              Remove filters
            </Button>
          </div>
        </div>
      </div>

      <Map
        center={this.state.testMarkers[0].latLng}
        zoom={this.state.zoom}
        minZoom={3}
        zoomControl={!isMobile}
      >
        <TileLayer
          attribution='&amp;copy <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
        />
        {this.state.serverMarkers.map((polygon, i) => (
          <Polygon
            onClick={() => this.togglePolygon(polygon)}
            color={polygon.selected ? "darkred" : "darkblue"}
            positions={polygon.coordinates}
            key={i}
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
    return this.renderMap();
  }
}
