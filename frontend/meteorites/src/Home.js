import React, { Component } from "react";
import { Map, TileLayer, Polygon } from "react-leaflet";
import "leaflet/dist/leaflet.css";
import L from "leaflet";
import icon from "leaflet/dist/images/marker-icon.png";
import iconShadow from "leaflet/dist/images/marker-shadow.png";
import testMarkers from "./testMarkers";
import { Button, Image, Modal } from "react-bootstrap";
import "./Home.css";
import { Link } from "react-router-dom";
import { ROOT_URL, unaryOperations, binaryOperations } from "./services";
import { isMobile } from "react-device-detect";
import Select from "react-select";
import Loader from "react-loader";
import history from "./history";
import proj4 from "proj4";

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
      selectedOperation: "",
      selectedLabel: "",
      wideMenu: true,
      showQueryResult: false,
      showModal: false,
      firstDS: "",
      secondDS: "",
      datasets: [],
      showDualHeading: false,
      firstProjection:
        "+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext  +no_defs",
      secondProjection: "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"
    };
  }

  async componentDidMount() {
    var tmpCoordinates = [];
    var tmpMarkers = [];

    this.setState({ loading: true });

    if (!this.state.dataset || !this.state.dataverse) {
      this.setState({ loading: false });
      history.push("/select");
    }

    if (this.state.dataset === "test") {
      this.setState({
        serverMarkers: [
          {
            coordinates: [[48.22467264956519, 2.8125]],
            properties: {},
            geometry: {
              type: "FeatureCollection",
              features: [
                {
                  type: "Feature",
                  properties: {},
                  geometry: {
                    type: "Point",
                    coordinates: [2.8125, 48.22467264956519]
                  }
                }
              ]
            }
          }
        ],
        selected: false,
        loading: false
      });
      return;
    }

    fetch(`http://${ROOT_URL}:19002/query/service`, {
      method: "POST",
      body: `select value ${this.state.dataset} from ${this.state.dataverse}.${this.state.dataset};`
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
          if (!result.geometry && result.geometries) {
            result.geometries.forEach(geometry => {
              console.log(geometry);
              //  NASTAVI ISTO KO DOLE
            });
          }

          switch (result.geometry.type) {
            case "Polygon" || "MultiLineString":
              coordinates = result.geometry.coordinates[0];
              break;
            case "MultiPolygon":
              coordinates = result.geometry.coordinates[0][0];
              break;
            case "LineString":
              coordinates = result.geometry.coordinates;
              break;
            case "Point":
              coordinates = [result.geometry.coordinates];
              break;
            default:
              coordinates = result.geometry.coordinates[0];
          }
          coordinates.forEach(coo => {
            let transformedCoordinates = proj4(
              this.state.firstProjection,
              this.state.secondProjection,
              coo
            );
            tmpCoordinates.push(transformedCoordinates.reverse());
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

    await fetch(`http://${ROOT_URL}:19002/query/service`, {
      method: "POST",
      body: `select dVerse, dSet from ExistingDV.ExistingDS;`
    })
      .then(res => res.json())
      .then(response => {
        response.results.forEach(ds => {
          this.setState({
            datasets: [
              ...this.state.datasets,
              { label: ds.dSet.toString(), value: `${ds.dVerse}.${ds.dSet}` }
            ]
          });
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
    if (this.state.showQueryResult) return;
    const idAttribute = localStorage.getItem("id").toString();
    if (!this.state.selectedPolygons.includes(polygon)) {
      if (this.state.selectedPolygons.length >= 2) return;
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
  };

  clearSelections = () => {
    this.state.serverMarkers.forEach(marker => {
      marker.selected = false;
    });

    this.setState({
      selectedPolygons: [],
      showQueryResult: false,
      showDualHeading: false,
      queryResult: [],
      refresh: !this.state.refresh
    });
  };

  sendIndividualRequest = (operation, label) => {
    if (!operation || this.state.selectedPolygons.length === 0) {
      alert("Please select operation and polygons.");
      return;
    }

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
        if (
          typeof response.results[0] === "boolean" ||
          typeof response.results[0] === "number"
        ) {
          alert(`${label}: ${response.results}`);
          return;
        }
        if (this.state.selectedPolygons.length > 1) {
          this.setState({
            showQueryResult: true,
            queryResult: response.results
          });
        } else {
          alert(`${label}: ${response.results}`);
        }
      });
  };

  sendDualRequest(first, second, operation) {
    this.setState({ loading: true, showDualHeading: true });

    // operate on those two datasets
    fetch(`http://${ROOT_URL}:19002/query/service`, {
      method: "POST",
      body: `${operation}(st_union((select value geometry from ${first})), st_union((select value geometry from ${second})));`
    })
      .then(res => res.json())
      .then(response => {
        if (typeof response.results[0] === "boolean") {
          alert(`${operation}: ${response.results}`);
          this.setState({
            showModal: false,
            showDualHeading: false,
            loading: false
          });
          return;
        }

        let tmpCoordinates = [],
          tmpMarkers = [],
          tmpCoo = [];

        console.log(response);

        if (response.results[0].geometries) {
          response.results[0].geometries.forEach(geometry => {
            geometry.coordinates.forEach(coo => {
              tmpCoordinates = [];
              coo[0].forEach(c => {
                let transformedCoordinates = proj4(
                  this.state.firstProjection,
                  this.state.secondProjection,
                  c
                );
                tmpCoordinates.push(transformedCoordinates.reverse());
              });
              tmpCoo.push(tmpCoordinates);
            });
          });
        } else {
          response.results[0].coordinates.forEach(coo => {
            tmpCoordinates = [];
            coo[0].forEach(c => {
              let transformedCoordinates = proj4(
                this.state.firstProjection,
                this.state.secondProjection,
                c
              );
              tmpCoordinates.push(transformedCoordinates.reverse());
            });
            tmpCoo.push(tmpCoordinates);
          });
        }

        tmpMarkers.push({
          coordinates: tmpCoo,
          geometry: response.results[0],
          selected: false
        });

        this.setState({
          showQueryResult: true,
          showDualHeading: true,
          queryResult: tmpMarkers,
          showModal: false,
          loading: false
        });
      });
  }

  renderMap = () => (
    <div class="whole-map">
      {this.state.showModal && (
        <div
          onClick={() => this.setState({ showModal: false })}
          className="overlay"
        />
      )}
      {this.state.loading && (
        <div>
          <Loader loaded={false} />
          <div
            onClick={() => this.setState({ showModal: false })}
            className="overlay"
          />
        </div>
      )}
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
          <h3 className="title">
            <Image src="map-pin.png" width="40" />
            {this.state.showDualHeading ? `` : localStorage.getItem("dataset")}
          </h3>
          {this.state.showQueryResult && (
            <div>
              <h3>{`Query result for operation "${this.state.selectedLabel}" on datasets:`}</h3>
              <h5 class="alert alert-dark">
                {this.state.firstDS.split(".")[1]}
              </h5>
              <h5 class="alert alert-dark">
                {this.state.secondDS.split(".")[1]}
              </h5>
            </div>
          )}
          {!this.state.showQueryResult && (
            <Link className="btn btn-dark import-data" to="/select">
              Select active dataset
            </Link>
          )}
          {!this.state.showQueryResult && (
            <Link className="btn btn-dark import-data" to="/import">
              Import data
            </Link>
          )}
          {!this.state.showQueryResult && (
            <Button
              className="btn btn-dark import-data"
              onClick={() =>
                this.setState({ showModal: true, firstDS: "", secondDS: "" })
              }
            >
              Query on two datasets
            </Button>
          )}
          <div className="content">
            {!this.state.showQueryResult && (
              <div className="select">
                <Select
                  options={
                    this.state.selectedPolygons.length === 0
                      ? unaryOperations.concat(binaryOperations)
                      : this.state.selectedPolygons.length === 1
                      ? unaryOperations
                      : binaryOperations
                  }
                  onChange={opt =>
                    this.setState({
                      selectedOperation: opt.value,
                      selectedLabel: opt.label
                    })
                  }
                />
              </div>
            )}
            <br />
            <div className="btn">
              {/* <Button
                className="btn-dark"
                onClick={() => this.click(this.state.selectedOperation)}
              >
                Search
              </Button> */}
              <Button
                className="btn-secondary query-btn"
                onClick={() => this.clearSelections()}
              >
                {this.state.showQueryResult
                  ? "Cancel query"
                  : "Clear selection"}
              </Button>
              {!this.state.showQueryResult && (
                <Button
                  className="query-btn btn-secondary import-data"
                  onClick={() =>
                    this.sendIndividualRequest(
                      this.state.selectedOperation,
                      this.state.selectedLabel
                    )
                  }
                >
                  Send request
                </Button>
              )}
            </div>
          </div>
        </div>
      )}

      <Map
        id="map"
        center={
          this.state.serverMarkers.length > 0
            ? this.state.serverMarkers[0].coordinates[0]
            : this.state.testMarkers[0].latLng
        }
        zoom={this.state.zoom}
        minZoom={3}
        zoomControl={!isMobile}
        style={{ zIndex: 1 }}
      >
        <TileLayer
          attribution='&amp;copy <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
        />
        {!this.state.showQueryResult &&
          this.state.serverMarkers.map((polygon, i) => {
            if (polygon.coordinates)
              return (
                <Polygon
                  onClick={() => this.togglePolygon(polygon)}
                  color={polygon.selected ? "darkred" : "darkblue"}
                  positions={polygon.coordinates}
                  key={i}
                >
                  {/* <Popup>
                  <p>{polygon.geometry.type}</p>
                </Popup> */}
                </Polygon>
              );
            else return null;
          })}
        {this.state.showQueryResult &&
          this.state.queryResult.map((polygon, i) => {
            console.log(polygon.coordinates);
            if (polygon.coordinates)
              return (
                <Polygon
                  onClick={() => this.togglePolygon(polygon)}
                  color={polygon.selected ? "darkred" : "darkblue"}
                  positions={polygon.coordinates}
                  key={i}
                />
              );
            else return null;
          })}
      </Map>
      {this.state.showModal && (
        <Modal.Dialog>
          <Modal.Header>
            <Modal.Title>Select datasets and operation</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <div className="select">
              <p>First dataset</p>
              <Select
                options={this.state.datasets}
                onChange={opt => this.setState({ firstDS: opt.value })}
              />
            </div>
            <div className="select">
              <br />
              <p>Second dataset</p>

              <Select
                options={this.state.datasets}
                onChange={opt => this.setState({ secondDS: opt.value })}
              />
            </div>
            <div className="select">
              <br />
              <p>Operation</p>

              <Select
                options={binaryOperations}
                onChange={opt =>
                  this.setState({
                    selectedOperation: opt.value,
                    selectedLabel: opt.label
                  })
                }
              />
            </div>
          </Modal.Body>
          {/* TODO zaustavi ga da mu ostane u
          formi tipa union koji nesmije koristit na unarnom */}
          <Modal.Footer>
            <Button
              className="btn-secondary"
              onClick={() => this.setState({ showModal: false })}
            >
              Close
            </Button>
            <Button
              className="btn-dark"
              disabled={
                !(
                  this.state.firstDS &&
                  this.state.secondDS &&
                  this.state.selectedOperation
                )
              }
              onClick={() =>
                this.sendDualRequest(
                  this.state.firstDS,
                  this.state.secondDS,
                  this.state.selectedOperation
                )
              }
            >
              Send query
            </Button>
          </Modal.Footer>
        </Modal.Dialog>
      )}
    </div>
  );

  render() {
    return this.renderMap();
  }
}
