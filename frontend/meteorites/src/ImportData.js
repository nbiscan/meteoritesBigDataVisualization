import React, { Component } from "react";
import { Button, Label } from "react-bootstrap";
import { Link } from "react-router-dom";
import "./ImportData.css";
import history from "./history";
import { ROOT_URL } from "./services";
import Loader from "react-loader";

class ImportData extends Component {
  constructor(props) {
    super(props);

    this.handleFileChange = this.handleFileChange.bind(this);

    this.state = {
      fileContent: null,
      disabled: false,
      dataverse: "",
      type: "",
      properties: "",
      dataset: "",
      data: "",
      geojson: "",
      id: "",
      loading: false
    };
  }

  componentDidMount() {
    this.updateProgressBarImport();
    document.addEventListener("scroll", this.updateProgressBarImport);
  }

  updateProgressBarImport() {
    const progressBar = document.querySelector(".progress-bar");
    const contentImport = document.querySelector(".all");
    const scroll = window.pageYOffset;
    const endPosition =
      contentImport.offsetTop + contentImport.offsetHeight - window.innerHeight;
    const progress = Math.min(Math.ceil((scroll / endPosition) * 100), 100);

    if (progressBar) progressBar.style.width = `${progress}%`;
  }

  componentWillUnmount() {
    document.removeEventListener("scroll", this.updateProgressBarImport);
  }

  handleChangeDataverse = event => {
    this.setState({ dataverse: event.target.value, disabled: false });
  };

  handleChangeType = event => {
    this.setState({ type: event.target.value, disabled: false });
  };

  handleChangeProperties = event => {
    this.setState({ properties: event.target.value, disabled: false });
  };

  handleChangeId = event => {
    this.setState({ id: event.target.value, disabled: false });
  };

  handleChangeDataset = event => {
    this.setState({ dataset: event.target.value, disabled: false });
  };

  handleChangeData = event => {
    this.setState({ data: event.target.value, disabled: false });
  };

  handleChangeGeoJSON = event => {
    this.setState({ geojson: event.target.value, disabled: false });
  };

  handleFileChange(file) {
    if (!file) return;
    const fileReader = new FileReader();
    fileReader.onloadend = event => {
      this.setState({ fileContent: event.target.result });
    };
    fileReader.readAsText(file);
  }

  handleSubmitData = (dataverse, type, properties, dataset, geojson, id) => {
    if (
      this.state.dataverse === "" ||
      this.state.type === "" ||
      this.state.properties === "" ||
      this.state.dataset === "" ||
      (this.state.geojson === "" && this.state.fileContent === null)
    ) {
      this.setState({ disabled: true });
      return;
    }

    if (this.state.geojson === "") {
      geojson = this.state.fileContent;
    }

    this.setState({
      loading: true
    });

    geojson = JSON.parse(geojson);
    geojson = geojson.features;

    // wrap GIS data with AsterixDB st_geom_from_geojson function
    geojson.forEach(feature => {
      const val = JSON.stringify(feature["geometry"]);
      feature["geometry"] = `st_geom_from_geojson(${val})`;
    });

    var output = "";

    geojson.forEach(
      f =>
        (output += `{ "properties": ${JSON.stringify(
          f["properties"]
        )}, "geometry": ${f["geometry"]}},`)
    );

    fetch(`http://${ROOT_URL}:19002/query/service`, {
      method: "POST",
      body: `create dataverse ${dataverse} if not exists;
      use ${dataverse};
      create type ${type} if not exists as open {
        properties: ${properties},
        geometry: geometry?
      };
      create dataset ${dataset}(${type}) if not exists primary key properties.${id};
      insert into ${dataverse}.${dataset}(${`[${output.slice(0, -1)}]`});
    `
    }).then(resp => {
      if (resp.status === 200) {
        alert("Data successfully imported.");

        fetch(`http://${ROOT_URL}:19002/query/service`, {
          method: "POST",
          body: `
          insert into ExistingDV.ExistingDS([{
            'dVerse':'${dataverse}',
            'dSet': '${dataset}',
            'dType': '${properties}',
            'dID': '${id}'
          }]);
        `
        });

        history.push("/");
      } else {
        alert("Error importing file");
      }
      this.setState({
        loading: false
      });
    });
  };

  render() {
    if (this.state.loading)
      return (
        <div className="all">
          <Loader loaded={false} />
        </div>
      );
    else
      return (
        <div className="all">
          <div class="progress-bar" />
          <Link className="btn btn-dark button" to="/">
            Map
          </Link>
          <div style={{ margin: "50px" }}>
            <h2>Import data</h2>
            <hr />

            <h5 className="h">Dataverse name:</h5>
            <input
              className="form-control"
              name="dataverse"
              placeholder="Please enter name"
              type="text"
              required
              value={this.state.dataverse}
              onChange={this.handleChangeDataverse}
            />
            <hr />

            <h5 className="h">Type name:</h5>
            <input
              className="form-control"
              placeholder="Please enter name"
              type="text"
              required
              value={this.state.type}
              onChange={this.handleChangeType}
            />
            <hr />

            <h5 className="h">Properties object in JSON:</h5>
            <textarea
              className="form-control rounded-0"
              name="properties"
              placeholder="Please use following format: { id: integer, example: string?  }"
              type="text"
              required
              value={this.state.properties}
              onChange={this.handleChangeProperties}
              style={{ height: "400px" }}
            />
            <hr />

            <h5 className="h">Primary key:</h5>
            <input
              className="form-control"
              name="id"
              placeholder="Please specify which attribute is primary key"
              type="text"
              required
              value={this.state.id}
              onChange={this.handleChangeId}
            />
            <hr />

            <h5 className="h">Dataset name:</h5>
            <input
              className="form-control"
              name="dataset"
              placeholder="Please enter name"
              type="text"
              required
              value={this.state.dataset}
              onChange={this.handleChangeDataset}
            />

            <hr />

            <h5 className="h">Choose .geojson file containing data set: </h5>
            <input
              type="file"
              name="file"
              id="file"
              className="input-group mb-3"
              onChange={e => this.handleFileChange(e.target.files[0])}
            />

            <hr />

            {/* <h5 className="h">Or paste GeoJSON data here:</h5>
            <textarea
              className="form-control rounded-0"
              name="geojson"
              placeholder="Please enter GeoJSON data"
              type="text"
              required
              value={this.state.geojson}
              onChange={this.handleChangeGeoJSON}
              style={{ height: "400px" }}
            /> */}

            <Button
              className="button btn-dark"
              disabled={this.state.disabled}
              type="submit"
              onClick={() =>
                this.handleSubmitData(
                  this.state.dataverse,
                  this.state.type,
                  this.state.properties,
                  this.state.dataset,
                  this.state.geojson,
                  this.state.id
                )
              }
            >
              Submit form
            </Button>
            {this.state.disabled && (
              <Label className="warning">Enter all data to submit form.</Label>
            )}
          </div>
        </div>
      );
  }
}

export default ImportData;
