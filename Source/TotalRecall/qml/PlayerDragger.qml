import VPlay 1.0
import QtQuick 1.1

Item {
  id: playerDragger

  signal moveNow
  signal releasedNow

  MultiTouchArea {
    id: touchArea
    width: 50
    height: 50
    anchors.centerIn: parent

    drag.target: parent

    onPositionChanged: {
      playerDragger.moveNow()
    }
    onReleased: {
      playerDragger.releasedNow()
    }
  }

  DebugVisual {
    width: touchArea.width
    height: touchArea.height
    anchors.centerIn: parent
    color: "red"
  }
}
