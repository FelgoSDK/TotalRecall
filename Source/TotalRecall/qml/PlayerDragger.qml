import VPlay 1.0
import QtQuick 1.1

Item {
  id: playerDragger

  width: 50
  height: 50

  MultiTouchArea {
    width: parent.width
    height: parent.height

    drag.target: parent

    onPositionChanged: {
      parent.parent.moveNow()
    }
  }

  DebugVisual {
    color: "red"
  }
}
