import VPlay 1.0
import QtQuick 1.1
import ".."

EntityBase {
  id: pedestrian
  entityType: "pedestrian"

  property string pedSource: "chicken2-front.png"

  SingleSpriteFromFile {
    id:sprite
    translateToCenterAnchor: true

    filename: "../img/Images-hd2.json"
    source: pedSource
  }

  CircleCollider {
    id: collider
    radius: sprite.width /2
  }
  DebugVisual {
    x: -sprite.width/2
    y: -sprite.height/2
    width: sprite.width
    height: sprite.height
    color: "blue"
  }
}
