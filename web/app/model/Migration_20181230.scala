package model

import play.Logger
import play.api.libs.ws.WSClient

import scala.concurrent.{ExecutionContext, Future}

private[model] class Migration_20181230() {

  import Migration_20181230._

  def up(wsClient: WSClient, cloudberryURL: String)(implicit ec: ExecutionContext): Future[Boolean] = {
//    Future.traverse(Seq(MeteoritesDDL)) { jsonStr =>
    Future.traverse(Seq(MeteoritesDDL)) { jsonStr =>
      wsClient.url(cloudberryURL).withHeaders("Content-Type" -> "application/json").post(jsonStr).map { response =>
        if (response.status % 100 == 2) {
          true
        } else {
          Logger.info(response.statusText + ":" + response.body)
          false
        }
      }
    }.map(seqBoolean => seqBoolean.forall(_ == true))
  }
}

object Migration_20181230 {
  val migration = new Migration_20181230()

 // missing | on the beggining of each line, see original file for details 
  val MeteoritesDDL: String =
    """
      {
    "dataset": "meteorites.meteorites_ds",
    "schema": {
        "typeName": "meteorites.meteo",
        "dimension": [
            {
                "name": "created_at",
                "isOptional": false,
                "datatype": "Time"
            },
            {
                "name": "fall",
                "isOptional": true,
                "datatype": "String"
            },
            {
                "name": "id",
                "isOptional": false,
                "datatype": "String"
            },
            {
                "name": "name",
                "isOptional": true,
                "datatype": "String"
            },
            {
                "name": "nametype",
                "isOptional": true,
                "datatype": "String"
            },
            {
                "name": "recclass",
                "isOptional": true,
                "datatype": "String"
            },
            {
                "name": "reclat",
                "isOptional": true,
                "datatype": "String"
            },
            {
                "name": "reclong",
                "isOptional": true,
                "datatype": "String"
            }
        ],
        "measurement": [
            {
                "name": "geolocation",
                "isOptional": true,
                "datatype": "Point"
            },
            {
                "name": "mass",
                "isOptional": true,
                "datatype": "String"
            },
            {
                "name": "year",
                "isOptional": true,
                "datatype": "String"
            }
        ],
        "primaryKey": [
            "id"
        ],
        "timeField": "created_at"
    },
    "dataInterval": {
        "start": "1980-01-27T09:30:28.334+0100",
        "end": "2020-01-27T09:30:28.334+0100"
    },
    "stats": {
        "createTime": "2019-01-27T10:44:33.994+0100",
        "lastModifyTime": "2019-01-27T10:44:33.994+0100",
        "lastReadTime": "2019-01-27T10:44:33.994+0100",
        "cardinality": 1
    }
}
    """.stripMargin

  
}
