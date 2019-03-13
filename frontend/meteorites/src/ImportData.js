import React, { Component } from "react";
import { Button } from "react-bootstrap";
import history from "./history.js";
import "./ImportData.css";

class ImportData extends Component {
  state = { selectedFile: null, loading: false };

  handleSelectedFile = event => {
    this.setState({
      selectedFile: event.target.files[0]
    });
  };

  handleSubmitData = (dataverse, type, json, dataset, data) => {
    this.setState({
      loading: true
    });

    fetch(`http://localhost:19002/query/service`, {
      method: "POST",
      body: `create dataverse ${dataverse} if not exists;
      use ${dataverse};
      create type ${type} if not exists as open ${json};
      create dataset ${dataset}(${type}) if not exists primary key id;
      insert into ${dataverse}.${dataset}(${data});
    `
    }).then(resp => {
      this.setState({
        loading: false
      });
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
            ref={input => {
              this.dataverse = input;
            }}
          />
          <hr />

          <h5 className="h">Type name:</h5>
          <input
            className="form-control"
            placeholder="Please enter name"
            type="text"
            required
            ref={input => {
              this.type = input;
            }}
          />
          <hr />

          <h5 className="h">Data type format in JSON:</h5>
          <textarea
            className="form-control rounded-0"
            name="datatype"
            placeholder="Please enter GeoJSON data"
            type="text"
            required
            ref={input => {
              this.datatype = input;
            }}
          />
          <hr />

          <h5 className="h">Dataset name:</h5>
          <input
            className="form-control"
            name="dataset"
            placeholder="Please enter name"
            type="text"
            required
            ref={input => {
              this.dataset = input;
            }}
          />

          <hr />

          <h5 className="h">Choose .geojson file containing data set: </h5>
          <input type="file" name="" id="" onChange={this.handleSelectedFile} />

          <hr />

          <h5 className="h">Or paste GeoJSON data here:</h5>
          <textarea
            className="form-control rounded-0"
            name="geojson"
            placeholder="Please enter GeoJSON data"
            type="text"
            required
            ref={input => {
              this.geojson = input;
            }}
          />

          <Button
            className="button"
            type="submit"
            onClick={() =>
              this.handleSubmitData(
                this.dataverse.value,
                this.type.value,
                this.datatype.value,
                this.dataset.value,
                this.geojson.value
              )
            }
          >
            Submit form
          </Button>
          {this.state.loading && <h1>Loading</h1>}
        </div>
      </div>
    );
  }
}

export default ImportData;
