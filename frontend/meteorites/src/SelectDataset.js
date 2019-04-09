import React, { Component } from "react";
import { Button } from "react-bootstrap";

class SelectDataset extends Component {
  state = { datasets: [] };

  componentDidMount() {
    fetch(`http://localhost:19002/query/service`, {
      method: "POST",
      body: `select dVerse, dSet from ExistingDatasetsDV.ExistingDatasetsDS;`
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
          Map
        </Button>
        {this.state.datasets.map(ds => (
          <Button onClick={() => this.selectDataset(ds.dVerse, ds.dSet)}>
            {ds.dSet}
          </Button>
        ))}

        <Button onClick={() => this.selectDataset("failing", "test")}>
          fail
        </Button>
      </div>
    );
  }
}

export default SelectDataset;
