import React, { Component } from "react";
import { Button } from "react-bootstrap";
import "./SelectDataset.css";
import history from "./history";
import { ROOT_URL } from "./services";

class SelectDataset extends Component {
  state = { datasets: [] };

  componentDidMount() {
    fetch(`http://${ROOT_URL}:19002/query/service`, {
      method: "POST",
      body: `select dVerse, dSet, dType, dID from ExistingDV.ExistingDS;`
    })
      .then(res => res.json())
      .then(response => this.setState({ datasets: response.results }));
  }

  selectDataset(v, s, t, i) {
    localStorage.setItem("dataverse", v);
    localStorage.setItem("dataset", s);
    localStorage.setItem("datatype", t);
    localStorage.setItem("id", i);

    history.push("/");
  }

  render() {
    return (
      <div className="query">
        <Button
          className="button-map"
          bsStyle="secondary"
          onClick={() => history.push("/")}
        >
          Cancel
        </Button>
        <div className="select-ds">
          {this.state.datasets.map(ds => (
            <div className="dataset-pool">
              <h3>{ds.dSet}</h3>
              <p>{ds.dType}</p>
              <Button
                bsStyle="dark"
                onClick={() =>
                  this.selectDataset(ds.dVerse, ds.dSet, ds.dType, ds.dID)
                }
              >
                Select dataset
              </Button>
            </div>
          ))}
          <div className="dataset-pool">
            <h3>Failing dataset used for testing</h3>
            <Button
              bsStyle="dark"
              onClick={() =>
                this.selectDataset("failing", "test", "err", "err")
              }
            >
              Select dataset
            </Button>
          </div>
        </div>
      </div>
    );
  }
}

export default SelectDataset;
