import React, { Component } from "react";
import { Button } from "react-bootstrap";
import "./SelectDataset.css";

class SelectDataset extends Component {
  state = { datasets: [] };

  componentDidMount() {
    fetch(`http://localhost:19002/query/service`, {
      method: "POST",
      body: `select dVerse, dSet, dType from ExistingDatasetsDV.ExistingDatasetsDS;`
    })
      .then(res => res.json())
      .then(response => this.setState({ datasets: response.results }));
  }

  selectDataset(v, s) {
    localStorage.setItem("dataverse", v);
    localStorage.setItem("dataset", s);

    this.props.return();
  }

  render() {
    return (
      <div className="query">
        <Button
          className="button-map"
          bsStyle="dark"
          onClick={() => this.props.return()}
        >
          Cancel
        </Button>
        <div className="select-ds">
          {this.state.datasets.map(ds => (
            <div className="dataset-pool">
              <Button
                bsStyle="dark"
                onClick={() => this.selectDataset(ds.dVerse, ds.dSet)}
              >
                {ds.dSet}
              </Button>
              <p>{ds.dType}</p>
            </div>
          ))}
          <Button
            bsStyle="dark"
            onClick={() => this.selectDataset("failing", "test")}
          >
            faililng_ds_for_testing
          </Button>
        </div>
      </div>
    );
  }
}

export default SelectDataset;
