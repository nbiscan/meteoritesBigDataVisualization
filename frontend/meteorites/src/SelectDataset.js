import React, { Component } from "react";
import { Button } from "react-bootstrap";
import "./SelectDataset.css";
import history from "./history";
import { ROOT_URL } from "./services";

class SelectDataset extends Component {
  state = { datasets: [] };

  componentDidMount() {
    this.updateProgressBarSelect();
    document.addEventListener("scroll", this.updateProgressBarSelect);

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

  downloadData(v, s, t, i) {
    fetch(`http://${ROOT_URL}:19002/query/service`, {
      method: "POST",
      body: `select * from ${v}.${s};`
    })
      .then(res => res.json())
      .then(response => {
        if (response.status !== "success") {
          alert("Error fetching the data. Please try again.");
          return;
        }
        const myjson = JSON.stringify(response.results, null, 2);
        var x = window.open();
        x.document.open();
        x.document.write("<html><body><pre>" + myjson + "</pre></body></html>");
        x.document.close();
      });
  }

  componentWillUnmount() {
    document.removeEventListener("scroll", this.updateProgressBarSelect);
  }

  updateProgressBarSelect() {
    const progressBar = document.querySelector(".progress-bar");
    const content = document.querySelector(".query");
    const scroll = window.pageYOffset;
    const endPosition =
      content.offsetTop + content.offsetHeight - window.innerHeight;
    const progress = Math.min(Math.ceil((scroll / endPosition) * 100), 100);

    progressBar.style.width = `${progress}%`;
  }

  render() {
    return (
      <div className="query">
        <div class="progress-bar" />
        <Button
          className="button-map btn-secondary"
          onClick={() => history.push("/")}
        >
          Cancel
        </Button>
        <div className="select-ds">
          {this.state.datasets.map(ds => {
            const type = JSON.parse(JSON.stringify(ds.dType, null, 2));
            return (
              <div className="dataset-pool">
                <h3>{ds.dSet.toString()}</h3>
                <div>
                  <pre>{type}</pre>
                </div>
                <Button
                  className="btn-dark"
                  onClick={() =>
                    this.selectDataset(ds.dVerse, ds.dSet, ds.dType, ds.dID)
                  }
                >
                  Select dataset
                </Button>
                <Button
                  className="btn-secondary"
                  onClick={() =>
                    this.downloadData(ds.dVerse, ds.dSet, ds.dType, ds.dID)
                  }
                >
                  Download data
                </Button>
              </div>
            );
          })}
          <div className="dataset-pool">
            <h3>Failing dataset used for testing</h3>
            <Button
              className="btn-dark"
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
