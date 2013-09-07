import VPlay 1.0
import QtQuick 1.1
import ".."

EntityBase {
  id: pedestrian
  entityType: "pedestrian"

  property string pedSource: "chicken2-front.png"

  width: sprite.width
  height: sprite.height

  scale: 0.2

  SingleSpriteFromFile {
    id:sprite
    translateToCenterAnchor: false

    filename: "../img/Images-hd2.json"
    source: pedSource
  }

  CircleCollider {
    radius: parent.width /2
    width: parent.width
    height: parent.height

    DebugVisual {
      color: "yellow"
    }
  }
}
