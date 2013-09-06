import VPlay 1.0
import QtQuick 1.1

Item {
  id: level

  Rectangle {
    anchors.fill: parent
    opacity: 0.5
  }

  //  SpriteBatchContainer {
  //    id: spriteBatchContainer
  //  }

  SingleSpriteFromFile {
    id:testObject
    translateToCenterAnchor: false
    anchors.centerIn: parent

    filename: "img/Images-hd2.json"
    source: "badCorn.png"
  }

  SingleSpriteFromFile {
    id:testObject2
    translateToCenterAnchor: false

    filename: "img/Images-hd2.json"
    source: "chicken2-front.png"
  }
}
