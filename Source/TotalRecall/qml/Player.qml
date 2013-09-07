import VPlay 1.0
import QtQuick 1.1

Item {
  id: playerInstance

  function moveNow() {
    character.moveNow()
  }

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
