import VPlay 1.0
import QtQuick 1.1

Item {
  width: levelBackground.width
  height: levelBackground.height

  MultiResolutionImage {
    id: levelBackground
    source: "img/bgSubmenu-hd2.png"
  }
}
