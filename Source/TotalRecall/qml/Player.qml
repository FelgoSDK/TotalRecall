import VPlay 1.0
import QtQuick 1.1

Item {
  id: playerInstance

  width: 50
  height: 50

  PlayerDragger {
    id: playerDragger
    width: parent.width
    height: parent.width
  }

  PlayerFollower {
    id: character
    realTarget: playerDragger
  }

  DebugVisual {
    color: "orange"
  }
}
