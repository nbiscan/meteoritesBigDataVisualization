import React, { Component } from 'react';
import { VectorMap } from "react-jvectormap"
import axios from 'axios';

class App extends Component {

  constructor(props) {
    super(props);
    this.state = {
      markerStyle: {
        initial: {
          fill: '#F8E23B',
          stroke: '#383f47'
        },
        hover: {
          "fill-opacity": 0.8,
          cursor: 'pointer',
          fill: 'red',
          stroke: '#383f47'
        },
      },
    };
    this.markers = [{ "fall": "Fell", "latLng": [36.23333, 37.13333], "id": "462", "mass": "3200", "name": "Aleppo", "nametype": "Valid", "recclass": "L6", "reclat": "36.233330", "reclong": "37.133330", "year": "1873-01-01T00:00:00.000" }
      , { "fall": "Fell", "latLng": [44.88333, 8.75], "id": "463", "mass": "908", "name": "Alessandria", "nametype": "Valid", "recclass": "H5", "reclat": "44.883330", "reclong": "8.750000", "year": "1860-01-01T00:00:00.000" }]
  }

  componentDidMount() {
    fetch('http://localhost:9000/berry', {
      method: 'POST',
      headers: {
        'Content-Type':'application/json'
      },
      data: JSON.stringify({
        "dataset": "meteorites.meteorites_ds",
        "select": "geolocation"
      })
    }
    );
  }

  render() {
    return (
      <div>
        <div style={{ height: '100vh', width: '100%' }}>
          <VectorMap map={'world_mill'}
            backgroundColor="#383f47"
            ref="map"
            containerStyle={{
              width: '100%',
              height: '100%'
            }}
            containerClassName="map"
            regionStyle={this.state.regionStyle}
            markerStyle={this.state.markerStyle}
            markers={this.markers}
          />
        </div>
      </div >
    )
  }
}
export default App;
