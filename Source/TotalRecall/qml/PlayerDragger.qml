import VPlay 1.0
import QtQuick 1.1

Item {

  /*BoxCollider {
    id: collider
    width: parent.width
    height: parent.height
  }*/

  MultiTouchArea {
    width: parent.width
    height: parent.height

    drag.target: parent
  }

  DebugVisual {
    color: "red"
  }
}
