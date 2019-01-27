import React, { Component } from 'react';
import { VectorMap } from "react-jvectormap"

class App extends Component {

  constructor(props) {
    super(props);
    this.ws = new WebSocket('ws://localhost:9000/ws')
    this.state = {
      serverMarkers: [],
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
    this.testMarkers = [{ "fall": "Fell", "latLng": [36.23333, 37.13333], "id": "462", "mass": "3200", "name": "Aleppo", "nametype": "Valid", "recclass": "L6", "reclat": "36.233330", "reclong": "37.133330", "year": "1873-01-01T00:00:00.000" }
      , { "fall": "Fell", "latLng": [44.88333, 8.75], "id": "463", "mass": "908", "name": "Alessandria", "nametype": "Valid", "recclass": "H5", "reclat": "44.883330", "reclong": "8.750000", "year": "1860-01-01T00:00:00.000" }];
  }

  componentDidMount() {

    var meteorites = [];

    this.ws.onmessage = function (event) {
      //console.log(JSON.parse(event.data));

      meteorites = JSON.parse(event.data);

    };
    this.ws.onopen = () => this.ws.send(JSON.stringify({


      "dataset": "meteorites.meteorites_ds",
      "filter": [{
        "field": "fall",
        "relation": "matches",
        "values": ["Fell"]
      }],
      "group": {
        "by": [{
          "field": "name"
        },
        {
          "field": "geolocation"
        },
        {
          "field": "year"
        },
        {
          "field": "mass"
        }],
        "aggregate": [{
          "field": "*",
          "apply": {
            "name": "count"
          },
          "as": "count"
        }]
      },
      "select": {
        "order": ["count"],
        "limit": 1000,
        "offset": 0
      }

    }));
    setTimeout(() => {
      console.log(meteorites)
      var tmpMarkers = [];
      if (!meteorites[0]) {
        window.location.reload();
      }
      meteorites[0].forEach(meteorite => {
        var metYear = meteorite.year ? meteorite.year.split('-')[0] : 'unknown';
        var metMass = meteorite.mass ? `${meteorite.mass.split('-')[0]} g` : 'unknown';
        tmpMarkers.push({
          "name": `Name: ${meteorite.name}, Year: ${metYear}., Mass: ${metMass}`,
          "latLng": meteorite.geolocation ? [meteorite.geolocation.coordinates[1], meteorite.geolocation.coordinates[0]] : undefined,
        });
      });
      this.setState({
        serverMarkers: tmpMarkers
      });
    },
      1500);


  }

  click() {
    
    

  }


  onMarkerSelect() {
    console.log('a');
  }

  handleData(data) {
    let result = JSON.parse(data);
    console.log(result.movement);
  }

  render() {
    return (
      <div>
        {/* <button onClick={() => this.click()}>Click Me</button> */}
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
            markers={this.state.serverMarkers}
            onMarkerSelected={this.onMarkerSelect}
          />
        </div>
      </div >
    )
  }
}
export default App;
