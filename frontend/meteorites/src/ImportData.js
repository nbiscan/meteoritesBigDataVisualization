import React, { Component } from "react";
import { Button } from "react-bootstrap";
import history from "./history.js";
import "./ImportData.css";

class ImportData extends Component {
  state = {
    selectedFile: null,
    disabled: false,
    dataverse: "",
    type: "",
    datatype: "",
    dataset: "",
    data: "",
    geojson: ""
  };

  handleChangeDataverse = event => {
    this.setState({ dataverse: event.target.value, disabled: false });
  };

  handleChangeType = event => {
    this.setState({ type: event.target.value, disabled: false });
  };

  handleChangeDatatype = event => {
    this.setState({ datatype: event.target.value, disabled: false });
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

  handleSelectedFile = event => {
    this.setState({
      selectedFile: event.target.files[0]
    });
  };

  handleSubmitData = (dataverse, type, datatype, dataset, geojson) => {
    if (
      this.state.dataverse === "" ||
      this.state.type === "" ||
      this.state.datatype === "" ||
      this.state.dataset === "" ||
      this.state.geojson === ""
    ) {
      this.setState({ disabled: true });
      return;
    }

    fetch(`http://localhost:19002/query/service`, {
      method: "POST",
      body: `create dataverse ${dataverse} if not exists;
      use ${dataverse};
      create type ${type} if not exists as open ${datatype};
      create dataset ${dataset}(${type}) if not exists primary key id;
      insert into ${dataverse}.${dataset}(${geojson});
    `
    }).then(resp => {
      if (resp.status === 200) {
        alert("Data successfully imported.");
        history.push("/");
      } else {
        alert("Error importing file.");
      }
    });
  };

  render() {
    return (
      <div className="all">
        <Button className="button" onClick={() => history.push("/")}>
          Map
        </Button>
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

          <h5 className="h">Data type format in JSON:</h5>
          <textarea
            className="form-control rounded-0"
            name="datatype"
            placeholder="Please enter data"
            type="text"
            required
            value={this.state.datatype}
            onChange={this.handleChangeDatatype}
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

          {/* <h5 className="h">Choose .geojson file containing data set: </h5>
          <input type="file" name="" id="" onChange={this.handleSelectedFile} />

          <hr /> */}

          <h5 className="h">Or paste GeoJSON data here:</h5>
          <textarea
            className="form-control rounded-0"
            name="geojson"
            placeholder="Please enter GeoJSON data"
            type="text"
            required
            value={this.state.geojson}
            onChange={this.handleChangeGeoJSON}
          />

          <Button
            className="button"
            disabled={this.state.disabled}
            type="submit"
            onClick={() =>
              this.handleSubmitData(
                this.state.dataverse,
                this.state.type,
                this.state.datatype,
                this.state.dataset,
                this.state.geojson
              )
            }
          >
            Submit form
          </Button>
          {this.state.disabled && (
            <p className="warning">Enter all data to submit form.</p>
          )}
        </div>
      </div>
    );
  }
}

export default ImportData;
