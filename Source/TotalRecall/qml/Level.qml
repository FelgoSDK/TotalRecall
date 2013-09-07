import VPlay 1.0
import QtQuick 1.1
import "entities"

Item {
  id: level

//  SpriteBatchContainer {
//    id: spriteBatchContainer
//  }

  PlayerDragger {
    id: playerDragger
    x: level.width/2-width/2
    y: 10+50
    onMoveNow: character.moveNow()
    onReleasedNow: character.releasedNow()
  }

  PlayerFollower {
    id: character
    entityId: "r"
    x: level.width/2-width/2
    y: 10+50
    realTarget: playerDragger
  }

  PlayerDragger {
    id: playerDragger2
    x: level.width/2-width/2
    y: level.height-10-50
    onMoveNow: character2.moveNow()
    onReleasedNow: character2.releasedNow()
  }

  PlayerFollower {
    id: character2
    entityId: "g"
    x: level.width/2-width/2
    y: level.height-10-50
    realTarget: playerDragger2
  }
}
