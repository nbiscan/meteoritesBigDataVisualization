import React, { Component } from 'react';
import { VectorMap } from "react-jvectormap"
import { Button } from 'react-bootstrap';
import './App.css';

class App extends Component {

  constructor(props) {
    super(props);
    this.ws = new WebSocket('ws://localhost:9000/ws');
    this.state = {
      serverMarkers: [],
      queryResult: [],
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
    var tmpMarkers = [];

    fetch(`http://localhost:19002/query/service`, {
      method: 'POST',
      body: `select name, geolocation, year, mass from meteorites.meteorites_ds;`,
    }).then((res) => res.json())
      .then((response) => {
        this.setState({
          queryResult: response.results
        });
        console.log(this.state.queryResult)

        response.results.forEach(meteorite => {
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

      });

  }

  click(text) {
    var tmpMarkers = [];

    fetch(`http://localhost:19002/query/service`, {
      method: 'POST',
      body: `select name, geolocation, year, mass from meteorites.meteorites_ds where name like "%${text}%";`,
    }).then((res) => res.json())
      .then((response) => {
        this.setState({
          queryResult: response.results
        });
        console.log(this.state.queryResult)

        response.results.forEach(meteorite => {
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

      });

      if (text == ""){
        document.getElementsByClassName('form')[0].value = '';
      }

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
        <div className="background">
          <div className="input">
            <input className="form" placeholder='Enter full name or segment' ref={(input) => {
              this.text = input;
            }} />
            <div className='btn'><Button onClick={() => this.click(this.text.value)}>Search</Button></div>
            <Button onClick={() => this.click("")}>Show all</Button>
          </div>
        </div>
        <div style={{ height: '95vh', width: '100%' }}>
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
