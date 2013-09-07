import VPlay 1.0
import QtQuick 1.1

Item {
  id: playerInstance

  function moveNow() {
    character.moveNow()
  }

  PlayerDragger {
    id: playerDragger
  }

  PlayerFollower {
    id: character
    x: parent.x
    y: parent.y
    realTarget: playerDragger
  }
}
