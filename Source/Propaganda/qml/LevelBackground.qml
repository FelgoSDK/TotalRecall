import VPlay 1.0
import QtQuick 1.1

Item {
  width: levelBackground.width
  height: levelBackground.height

  property alias source: levelBackground.source

  MultiResolutionImage {
    id: levelBackground
    source: "img/title-hd2.png"
  }
}
