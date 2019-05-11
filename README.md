# meteoritesBigDataVisualization

## Installation and configuration

1. Move to your home directory:
  `$ cd ~`

2. Download asterix-server-0.9.5-SNAPSHOT-binary-assembly.zip from this link:
  `$ wget http://cloudberry.ics.uci.edu/img/asterix-server-0.9.5-SNAPSHOT-binary-assembly.zip`
  
3. Uncompress the file:
  `$ unzip asterix-server-0.9.5-SNAPSHOT-binary-assembly.zip`

4. Move to frontend directory:
  `$ cd ./frontend/meteorites`

5. Run `$ npm install`

## Running the app

1. Start up AsterixDB instance using `~/apache-asterixdb-0.9.5-SNAPSHOT/opt/local/bin/start-sample-cluster.sh` command (you can stop the instance by changing `start` to `stop` in the same command)

2. Run the app by positioning inside `meteoritesBigDataVisualization/frontend/meteorites/` and running the `npm start` in that directory.
