import React, { Component } from "react";
import Input from "./Input";
import { Button } from "react-bootstrap";
import history from "./history.js";
import "./ImportData.css";

class ImportData extends Component {
  state = { selectedFile: null, loaded: 0 };

  handleselectedFile = event => {
    this.setState({
      selectedFile: event.target.files[0]
      //loaded: 0
    });
  };

  render() {
    return (
      <div className="all">
        <Button onClick={() => history.push("/")}>Map</Button>
        <div style={{ margin: "50px" }}>
          <h2>Import data</h2>

          <h5 className="h">Dataverse name:</h5>
          <Input placeholder="Please enter name" type="text" required />

          <h5 className="h">Type name:</h5>
          <Input placeholder="Please enter name" type="text" required />

          <h5 className="h">Dataset name:</h5>
          <Input placeholder="Please enter name" type="text" required />

          <h5 className="h">Choose .geojson file containing data set: </h5>
          <input type="file" name="" id="" onChange={this.handleselectedFile} />
          {/* <button onClick={this.handleUpload}>Upload</button>
        <div> {Math.round(this.state.loaded, 2)} %</div> */}
        </div>
      </div>
    );
  }
}

export default ImportData;
