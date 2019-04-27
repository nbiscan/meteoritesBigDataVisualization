import React, { Component } from "react";
import { Button, Label } from "react-bootstrap";
import "./ImportData.css";

class ImportData extends Component {
  constructor(props) {
    super(props);

    this.handleFileChange = this.handleFileChange.bind(this);

    this.state = {
      fileContent: null,
      disabled: false,
      dataverse: "",
      type: "",
      datatype: "",
      dataset: "",
      data: "",
      geojson: "",
      id: ""
    };
  }

  handleChangeDataverse = event => {
    this.setState({ dataverse: event.target.value, disabled: false });
  };

  handleChangeType = event => {
    this.setState({ type: event.target.value, disabled: false });
  };

  handleChangeDatatype = event => {
    this.setState({ datatype: event.target.value, disabled: false });
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

  handleSubmitData = (dataverse, type, datatype, dataset, geojson, id) => {
    if (
      this.state.dataverse === "" ||
      this.state.type === "" ||
      this.state.datatype === "" ||
      this.state.dataset === "" ||
      (this.state.geojson === "" && this.state.fileContent === null)
    ) {
      this.setState({ disabled: true });
      return;
    }

    if (this.state.geojson === "") {
      geojson = this.state.fileContent;
    }

    fetch(`http://localhost:19002/query/service`, {
      method: "POST",
      body: `create dataverse ${dataverse} if not exists;
      use ${dataverse};
      create type ${type} if not exists as open ${datatype};
      create dataset ${dataset}(${type}) if not exists primary key ${id};
      insert into ${dataverse}.${dataset}(${geojson});
    `
    }).then(resp => {
      if (resp.status === 200) {
        alert("Data successfully imported.");

        fetch(`http://localhost:19002/query/service`, {
          method: "POST",
          body: `
          insert into ExistingDatasetsDV.ExistingDatasetsDS([{
            'dVerse':'${dataverse}',
            'dSet': '${dataset}',
            'dType': '${datatype}'
          }]);
        `
        });

        this.props.return();
      } else {
        alert("Error importing file.");
      }
    });
  };

  render() {
    return (
      <div className="all">
        <Button
          className="button"
          bsStyle="dark"
          onClick={() => this.props.return()}
        >
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

          <h5 className="h">Or paste GeoJSON data here:</h5>
          <textarea
            className="form-control rounded-0"
            name="geojson"
            placeholder="Please enter GeoJSON data"
            type="text"
            required
            value={this.state.geojson}
            onChange={this.handleChangeGeoJSON}
            style={{ height: "400px" }}
          />

          <Button
            className="button"
            disabled={this.state.disabled}
            type="submit"
            bsStyle="dark"
            onClick={() =>
              this.handleSubmitData(
                this.state.dataverse,
                this.state.type,
                this.state.datatype,
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
