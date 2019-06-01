import React, { Component } from "react";
import { Map, TileLayer, Popup, Polygon } from "react-leaflet";
import "leaflet/dist/leaflet.css";
import L from "leaflet";
import icon from "leaflet/dist/images/marker-icon.png";
import iconShadow from "leaflet/dist/images/marker-shadow.png";
import testMarkers from "./testMarkers";
import { Button, Image } from "react-bootstrap";
import "./Home.css";
import { Link } from "react-router-dom";
import { ROOT_URL, unaryAttributes, binaryAttributes } from "./services";
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
      selectedAttrubute: [],
      wideMenu: true,
      showQueryResult: false
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
      showQueryResult: false,
      queryResult: [],
      refresh: !this.state.refresh
    });
  };

  sendIndividualRequest = operation => {
    if (!operation || this.state.selectedPolygons.length === 0) {
      alert("Please select operation and polygons.");
      return;
    }

    this.state.selectedPolygons.forEach(id => {});

    const body =
      this.state.selectedPolygons.length === 1
        ? `${operation}(st_geom_from_geojson(${JSON.stringify(
            this.state.selectedPolygons[0].geometry
          )}));`
        : `${operation}(st_geom_from_geojson(${JSON.stringify(
            this.state.selectedPolygons[0].geometry
          )}), st_geom_from_geojson(${JSON.stringify(
            this.state.selectedPolygons[1].geometry
          )}));`;

    fetch(`http://${ROOT_URL}:19002/query/service`, {
      method: "POST",
      body
    })
      .then(res => res.json())
      .then(response => {
        console.log(response.results);
        this.setState({
          showQueryResult: true,
          queryResult: response.results
        });
      });
  };

  renderMap = () => (
    <div class="whole-map">
      {!this.state.wideMenu && (
        <div className="header-small">
          <Image
            src="menu-alt-512.png"
            className="toggle"
            onClick={() => this.setState({ wideMenu: true })}
          />
        </div>
      )}
      {this.state.wideMenu && (
        <div className="header">
          <Image
            src="x.png"
            className="toggle"
            onClick={() => this.setState({ wideMenu: false })}
          />
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
                options={unaryAttributes.concat(binaryAttributes)}
                onChange={opt =>
                  this.setState({ selectedAttrubute: opt.value })
                }
              />
            </div>
            <br />
            <div className="btn">
              {/* <Button
                className="btn-dark"
                onClick={() => this.click(this.state.selectedAttrubute)}
              >
                Search
              </Button> */}
              <Button
                className="btn-secondary query-btn"
                onClick={() => this.clearSelections()}
              >
                Clear filter and selection
              </Button>
              <Button
                className="query-btn btn-secondary import-data"
                onClick={() =>
                  this.sendIndividualRequest(this.state.selectedAttrubute)
                }
              >
                Send request
              </Button>
            </div>
          </div>
        </div>
      )}

      <Map
        center={
          this.state.serverMarkers.length > 0
            ? this.state.serverMarkers[0].coordinates[0]
            : this.state.testMarkers[0].latLng
        }
        zoom={this.state.zoom}
        minZoom={3}
        zoomControl={!isMobile}
      >
        <TileLayer
          attribution='&amp;copy <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
        />
        {!this.state.showQueryResult &&
          this.state.serverMarkers.map((polygon, i) => (
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
        {this.state.showQueryResult &&
          this.state.queryResult.map((polygon, i) => (
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
