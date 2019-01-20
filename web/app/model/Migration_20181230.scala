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


  val MeteoritesDDL: String =
    """
      |{
      |  "dataset":"meteorites.meteorites_ds",
      |  "schema":{
      |  	"typeName":"meteorites.meteo",
      |    "dimension":[
      |      {"name":"fall","isOptional":true,"datatype":"String"},
      |      {"name":"geolocation","isOptional":true,"datatype":"Point"},
      |      {"name":"id","isOptional":false,"datatype":"String"},
      |      {"name":"mass","isOptional":true,"datatype":"String"},
      |      {"name":"name","isOptional":true,"datatype":"String"},
      |      {"name":"nametype","isOptional":true,"datatype":"String"},
      |      {"name":"recclass","isOptional":true,"datatype":"String"},
      |      {"name":"reclat","isOptional":true,"datatype":"String"},
      |      {"name":"reclong","isOptional":true,"datatype":"String"},
      |      {"name":"year","isOptional":true,"datatype":"String"}
      |    ],
      |    "measurement":[
      |      {"name":"geolocation","isOptional":true,"datatype":"Point"},
      |      {"name":"mass","isOptional":true,"datatype":"String"},
      |      {"name":"year","isOptional":true,"datatype":"String"}
      |    ],
      |    "primaryKey":["id"]
      |  }
      |}
    """.stripMargin

  
}
