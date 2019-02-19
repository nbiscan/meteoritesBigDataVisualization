# meteoritesBigDataVisualization

## Installation and configuration

1. Configure AsterixDB and Cloudberry on your machine [here](http://cloudberry.ics.uci.edu/quick-start).

2. Ingest data using `./script/ingestMeteoritesToLocalCluster.sh` and data from `./web/app/model/Migration_20181230.scala`.

2. `$ cd ./frontend/meteorites`

3. `$ npm install`

4. `$ npm start`

## Running the app

1. Start up AsterixDB instance using `~/apache-asterixdb-0.9.5-SNAPSHOT/opt/local/bin/start-sample-cluster.sh` command (you can stop the instance by changing start to stop it the same command)

2. Compile and start Cloudberry using:

`~/cloudberry> cd cloudberry`

`~/cloudberry> sbt compile`

`~/cloudberry> sbt "project neo" "run"`


3. Run the app by positioning inside `meteoritesBigDataVisualization/frontend/meteorites/` and running the `npm start` in that directory.
